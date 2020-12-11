#include "device/time_service.hpp"

#include <avr/io.h>
#include <avr/interrupt.h>

namespace device
{

volatile uint8_t TimeService::current_time_;

void TimeService::initialize()
{
    current_time_ = 0;

    // Enable interrupts
    sei();

    // Disable power reduction
    PRR &= ~((1 << PRTIM1));

    // Firstly, stop the timer
    TCCR1B &= ~((1 << CS12) | (1 << CS11) | (1 << CS10));

    // Disable all interrupts, except overflow
    TIMSK1 = (0 << ICIE1) | (0 << OCIE1B) | (1 << OCIE1A) | (0 << TOIE1);

    // Overflow every 2.5 milliseconds: 2.5 MHz / 6250 = 400 Hz
    OCR1A = 6250 - 1;

    // Disable compare outputs, set CTC mode, frequency 20 MHz / 8 = 2.5 MHz
    TCCR1A = (0 << COM1A1) | (0 << COM1A0) |  // Disable OCA
            (0 << COM1B1) | (0 << COM1B0) |  // Disable OCB
            (0 << WGM11) | (0 << WGM10);  // Start setting up CTC mode
    TCCR1C = (0 << FOC1A) | (0 << FOC1B);  // No force output
    TCCR1B = (0 << ICNC1) | (0 << ICES1) |  // Disable input capture processing
            (0 << WGM13) | (1 << WGM12) |  // Finish setting up CTC mode
            (0 << CS12) | (1 << CS11) | (0 << CS10);  // Clock select
}

}  // namespace device

ISR(TIMER1_COMPA_vect)
{
    ++device::TimeService::current_time_;
}
