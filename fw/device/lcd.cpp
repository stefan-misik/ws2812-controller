#include "device/lcd.hpp"

#include <avr/pgmspace.h>
#include <avr/io.h>

namespace device
{

class LcdIo
{
private:
    /** @brief Initialize CPU peripherals */
    static void initialize()
    {
        // Disable power reduction for SPI
        PRR &= ~(1 << PRSPI);
        // Set output direction to LCD DC, SCE, LED pin
        DDRD |= ( (1 << DDD2) | (1 << DDD4) | (1 << DDD5) );
        // Set SS pin as output
        DDRB |= (1 << DDB2);

        // Set MOSI and SCK output, all others input
        DDRB |= ( (1 << DDB3) | (1 << DDB5) );
        // DDRB &= ~( (1 << DDB4) );

        // Enable SPI, Master, set clock rate fck/8 (double rate)
        SPCR = ( (1 << SPE) | (1 << MSTR) | (0 << SPR1) | (1 << SPR0) );
        SPSR |= (1 << SPI2X);
    }

    /** \brief Put LCD mode to Data Mode */
    static void setData() { PORTD |= (1 << PORTD2); }
    /** \brief Put LCD mode to Command Mode */
    static void setCommand() { PORTD &= ~(1 << PORTD2); }

    /** @brief Activate serial LCD's serial interface */
    static void activate() { PORTB &= ~(1 << PORTB2); }
    /** @brief Release serial LCD's serial interface */
    static void release() { PORTB |= (1 << PORTB2); }

    /**
     * @brief Transmit single byte using SPI into the LCD
     *
     * @param data Byte to be transmitted
     */
    static void transmit(char data)
    {
        // Start transmission
        SPDR = data;
        // TODO(stefan.misik) Check is this can be put before writing SPDR
        // Wait for transmission to complete
        while( !(SPSR & (1 << SPIF)) )
            ;
    }

    friend class Lcd;
};


void Lcd::initialize()
{
    LcdIo::initialize();

    update_parameters_ = 0;
    setParameter(Parameter::CONTRAST, 65);
    setParameter(Parameter::TEMPERATURE_COEFICIENT, 0);
    setParameter(Parameter::BIAS, 3);  // LCD bias mode 1:48

    LcdIo::activate();
    LcdIo::setCommand();
    LcdIo::transmit(0x0C);  // Normal operation
    LcdIo::release();
}

void Lcd::update()
{
    static const uint8_t bases[] PROGMEM = {0x04, 0x10, 0x80};
    static const uint8_t masks[] PROGMEM = {0x03, 0x07, 0x7F};

    LcdIo::activate();

    LcdIo::setCommand();
    // If requested, update extended parameters
    if (0 != update_parameters_)
    {
        LcdIo::transmit(0x21); // Extended commands
        uint8_t update = update_parameters_;
        update_parameters_ = 0;
        for (uint8_t i = 0; i < PARAMETER_COUNT; ++i)
        {
            if (update & 1)
            {
                LcdIo::transmit((pgm_read_byte(bases + i)) |
                    (parameters_[i] & (pgm_read_byte(masks + i))));
            }
            update >>= 1;
        }
    }

    // Move "cursor" to the position (0, 0)
    LcdIo::transmit(0x20); // Basic commands
    LcdIo::transmit(0x40 | (0 & 0x07));  // Set Y = 0
    LcdIo::transmit(0x80 | (0 & 0x7F));  // Set X = 0

    // Start transmitting data
    LcdIo::setData();
    for (auto c: frame_buffer_)
    {
        LcdIo::transmit(c);
    }

    LcdIo::release();
}

void Lcd::setParameter(Parameter parameter, uint8_t value)
{
    uint8_t parameter_pos = static_cast<uint8_t>(parameter);
    if (parameter_pos < PARAMETER_COUNT)
    {
        if (INVALID_PARAMETER_VALUE == value)
        {
            update_parameters_ &= ~(1 << parameter_pos);
        }
        else
        {
            update_parameters_ |= (1 << parameter_pos);
            parameters_[parameter_pos] = value;
        }
    }
}

uint8_t Lcd::frame_buffer_[504];
uint8_t Lcd::update_parameters_;
uint8_t Lcd::parameters_[PARAMETER_COUNT];

}  // namespace device
