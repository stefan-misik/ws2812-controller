#include "device/led_controller.hpp"

#include <avr/io.h>


namespace device
{

namespace
{

/**
 * @brief Class used to generate code to update one of the two LED strips
 *
 * @tparam PINIOADDR Address in the IO space of the PINx register
 * @tparam PINBIT Number of the bit controlling pin to which the LED strip is
 *         connected
 */
template <uint16_t PINIOADDR, uint8_t PINBIT>
class LedControllerPrivate
{
    static constexpr uint8_t ZERO_BIT_PULSE_LENGTH = 2;
    static constexpr uint8_t ONE_BIT_PULSE_LENGTH = 4;

public:
    /**
     * @brief Update the LED strip with given data
     *
     * @param[in] data Begin of the LED strip data
     * @param[in] data_end Past-end of the LED strip data
     */
    static void update(const uint8_t * data, const uint8_t * data_end)
    {
        uint8_t current_byte;
        uint8_t bit_position;
        uint8_t pulse_length;
        uint8_t old_sreg;

        asm volatile (
                "    rjmp  lu_check_all_sent%=         \n"
                "lu_send_byte%=:                       \n"
                "    ld    %[current_byte], %a[data]+  \n"
                "    ldi   %[bit_position], 0x80       \n"

                "lu_send_bit%=:                        \n"
                "    ldi   %[pulse_length], %[zero_pl] \n"
                "    lsl   %[current_byte]             \n"
                "    brcc  lu_pulse_start%=            \n"
                "    ldi   %[pulse_length], %[one_pl]  \n"

                "lu_pulse_start%=:                     \n"
                "    in %[old_sreg], __SREG__          \n"
                "    cli                               \n"
                "    sbi   %[pinr], %[pinb]            \n"

                "lu_wait_pulse_end%=:                  \n"
                "    subi  %[pulse_length], 1          \n"
                "    brne  lu_wait_pulse_end%=         \n"
                "    sbi   %[pinr], %[pinb]            \n"
                "    out   __SREG__, %[old_sreg]       \n"

                "lu_check_byte_sent%=:                 \n"
                "    lsr   %[bit_position]             \n"
                "    brne  lu_send_bit%=               \n"

                "lu_check_all_sent%=:                  \n"
                "    cp    %A[data], %A[data_end]      \n"
                "    cpc   %B[data], %B[data_end]      \n"
                "    brne  lu_send_byte%=             \n"
                : [current_byte] "=&r" (current_byte),
                  [old_sreg] "=&r" (old_sreg),
                  [bit_position] "=&d" (bit_position),
                  [pulse_length] "=&d" (pulse_length)
                : [data] "z" (data),
                  [data_end] "e" (data_end),
                  [zero_pl] "M" (ZERO_BIT_PULSE_LENGTH),
                  [one_pl] "M" (ONE_BIT_PULSE_LENGTH),
                  [pinr] "I" (PINIOADDR),
                  [pinb] "I" (PINBIT)
        );
    }
};

}  // namespace


void LedController::initialize()
{
    // Set output direction to PD1
    PORTD &= ~((1 << PORTD0) | (1 << PORTD1));
    DDRD |= ((1 << DDD0) | (1 << DDD1));
}

void LedController::update(uint8_t out, const uint8_t * data, uint8_t length)
{
    const uint8_t * data_end = data + length;

    // The template argument 0x09 is the result of the _SFR_IO_ADDR(PIND) macro,
    // which compiler claims can not be evaluated at compile time.
    switch (out)
    {
    case 0:
        LedControllerPrivate<0x09, PIND0>::update(data, data_end);
        break;

    case 1:
        LedControllerPrivate<0x09, PIND1>::update(data, data_end);
        break;
    }
}

}  // namespace device
