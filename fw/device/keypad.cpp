#include "device/keypad.hpp"

#include <avr/io.h>

namespace device
{

void Keypad::initialize()
{
    // port connection: columns: PB1, PB2, PD7 and rows: PC0 - PC3

    // Make sure internal pull-ups are not disabled
    MCUCR &= ~(1 << PUD);

    // Set all keypad pins as inputs to enable pull-ups
    DDRB &= ~((1 << DDB1));
    DDRD &= ~((1 << DDD3) | (1 << DDD7));
    DDRC &= ~((1 << DDC0) | (1 << DDC1) | (1 << DDC2) | (1 << DDC3));

    // Turn on the internal pull-ups
    PORTB |= ((1 << PORTB1));
    PORTD |= ((1 << PORTD3) | (1 << PORTD7));
    PORTC |= ((1 << PORTC0) | (1 << PORTC1) | (1 << PORTC2) | (1 << PORTC3));
}

#define SELECT_COLUMN(port_letter, pin_no)  \
    PORT ## port_letter &= ~(1 << PORT ## port_letter ## pin_no);  \
    DDR ## port_letter |= (1 << DD ## port_letter ## pin_no)

#define DESELECT_COLUMN(port_letter, pin_no)  \
    DDR ## port_letter &= ~(1 << DD ## port_letter ## pin_no);  \
    PORT ## port_letter |= (1 << PORT ## port_letter ## pin_no)

void Keypad::selectColumn(uint8_t column)
{
    switch (column)
    {
    case 0:
        DESELECT_COLUMN(B, 1);
        SELECT_COLUMN(D, 3);
        break;

    case 1:
        DESELECT_COLUMN(D, 3);
        SELECT_COLUMN(D, 7);
        break;

    case 2:
        DESELECT_COLUMN(D, 7);
        SELECT_COLUMN(B, 1);
        break;

    default:
        DESELECT_COLUMN(D, 3);
        DESELECT_COLUMN(D, 7);
        DESELECT_COLUMN(B, 1);
    }
}

uint8_t Keypad::readColumn()
{
    return PINC & 0x0f;
}

}  // namespace device


