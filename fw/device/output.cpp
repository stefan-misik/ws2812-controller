#include "device/output.hpp"

#include <avr/io.h>

namespace device
{

void Output::initialize()
{
    // Set output direction on pins
    DDRD |= ((1 << DDD4) | (1 << DDD5) | (1 << DDD6));
    DDRB |= (1 << DDB0);

    // Disable power reduction
    PRR &= ~((1 << PRTIM0));

    // Disable timer 0 interrupts
    TIMSK0 &= ~((1 << OCIE0B) | (1 << OCIE0A) | (1 << TOIE0));

    uint8_t tmp;
    // LED = OC0A, BL = OC0B
    // Configure OC0A to non-inverting mode, OC0B to inverting mode
    tmp = TCCR0A;
    tmp |= ((1 << COM0A1) | (1 << COM0B1) | (1 << COM0B0));
    tmp &= ~((1 << COM0A0));
    // Configure mode 3 = Fast PWM
    tmp |= ((1 << WGM01) | (1 << WGM00));
    TCCR0A = tmp;
    tmp = TCCR0B;
    tmp &= ~((1 << FOC0A) | (1 << FOC0B) | (1 << WGM02));
    // Select clock source
    tmp &= ~((1 << CS02) | (1 << CS01) | (1 << CS00));
    tmp |= ((1 << CS02) | (0 << CS01) | (0 << CS00)); // clkio / 256
    TCCR0B = tmp;

    // Turn off all outputs
    setLed(0);
    setBacklight(0);
    setOut1(false);
    setOut2(false);
}

void Output::setLed(uint8_t brightness)
{
    OCR0A = (255 - brightness);
}

void Output::setBacklight(uint8_t brightness)
{
    OCR0B = (255 - brightness);
}

void Output::setOut1(uint8_t turn_on)
{
    if (turn_on)
    {
        PORTB |= (1 << PORTB0);
    }
    else
    {
        PORTB &= ~(1 << PORTB0);
    }
}

void Output::setOut2(uint8_t turn_on)
{
    if (turn_on)
    {
        PORTD |= (1 << PORTD4);
    }
    else
    {
        PORTD &= ~(1 << PORTD4);
    }
}

}  // namespace
