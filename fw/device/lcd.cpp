#include "device/lcd.hpp"

#include <avr/pgmspace.h>
#include <avr/io.h>

#include <util/delay.h>

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

    // Reset serial interface
    LcdIo::release();

    setExtendedOption(ExtendedOption::CONTRAST, 65);
    setExtendedOption(ExtendedOption::TEMPERATURE_COEFICIENT, 0);
    setExtendedOption(ExtendedOption::BIAS, 4);  // LCD bias mode 1:48

    LcdIo::activate();
    LcdIo::setCommand();

    // Normal operation
    LcdIo::transmit(0x0C);

    LcdIo::release();

    setPosition(0, 0);

    LcdIo::activate();
    LcdIo::setData();

    // Clear the display
    for(int i = 0; i < 504; ++i)
    {
        LcdIo::transmit(0x00);
    }

    LcdIo::release();

    setPosition(0, 0);
}

void Lcd::test()
{
    LcdIo::activate();
    LcdIo::setCommand();

    // All display segments on
    LcdIo::transmit(0x09);

    _delay_ms(1000);

    // Normal operation
    LcdIo::transmit(0x0C);

    LcdIo::release();
}

void Lcd::setExtendedOption(ExtendedOption option, uint8_t value)
{
    static const uint8_t bases[] PROGMEM = {0x04, 0x10, 0x80};
    static const uint8_t masks[] PROGMEM = {0x03, 0x07, 0x7F};

    LcdIo::activate();
    LcdIo::setCommand();

    LcdIo::transmit(0x21); // Extended commands
    // Write command
    LcdIo::transmit((pgm_read_byte(bases + static_cast<uint8_t>(option))) |
        (value & (pgm_read_byte(masks + static_cast<uint8_t>(option)))));
    LcdIo::transmit(0x20); // Basic commands

    LcdIo::release();
}

void Lcd::setPosition(uint8_t column, uint8_t row)
{
    // Enable serial interface
    LcdIo::activate();
    // Set command mode
    LcdIo::setCommand();

    // lcd_transmit(0x20);  // Basic commands - already in this mode
    LcdIo::transmit(0x40 | (row & 0x07));
    LcdIo::transmit(0x80 | (column & 0x7F));

    // Release serial interface
    LcdIo::release();
}

}  // namespace device
