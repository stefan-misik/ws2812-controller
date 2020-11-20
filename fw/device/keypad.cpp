#include "device/keypad.hpp"

#include <avr/pgmspace.h>
#include <avr/io.h>

namespace device
{
namespace
{

const uint16_t DIR_REGISTER[7] PROGMEM =
{
        reinterpret_cast<uint16_t>(&DDRB),
        reinterpret_cast<uint16_t>(&DDRD),
        reinterpret_cast<uint16_t>(&DDRD),
        reinterpret_cast<uint16_t>(&DDRC),
        reinterpret_cast<uint16_t>(&DDRC),
        reinterpret_cast<uint16_t>(&DDRC),
        reinterpret_cast<uint16_t>(&DDRC),
};

const uint16_t OUT_REGISTER[7] PROGMEM =
{
        reinterpret_cast<uint16_t>(&PORTB),
        reinterpret_cast<uint16_t>(&PORTD),
        reinterpret_cast<uint16_t>(&PORTD),
        reinterpret_cast<uint16_t>(&PORTC),
        reinterpret_cast<uint16_t>(&PORTC),
        reinterpret_cast<uint16_t>(&PORTC),
        reinterpret_cast<uint16_t>(&PORTC),
};

const uint16_t IN_REGISTER[7] PROGMEM =
{
        reinterpret_cast<uint16_t>(&PINB),
        reinterpret_cast<uint16_t>(&PIND),
        reinterpret_cast<uint16_t>(&PIND),
        reinterpret_cast<uint16_t>(&PINC),
        reinterpret_cast<uint16_t>(&PINC),
        reinterpret_cast<uint16_t>(&PINC),
        reinterpret_cast<uint16_t>(&PINC),
};

const uint8_t PIN_MASK[7] PROGMEM =
{
        (1 << 1),
        (1 << 7),
        (1 << 3),
        (1 << 0),
        (1 << 1),
        (1 << 2),
        (1 << 3),
};

#define KEYPAD_REGISTER(type, n)  \
    (*reinterpret_cast<volatile uint8_t *>(  \
            pgm_read_word(type ## _REGISTER + n)))


inline void activateColumn(uint8_t pin)
{
    uint8_t pin_mask = pgm_read_byte(PIN_MASK + pin);
    KEYPAD_REGISTER(OUT, pin) &= ~pin_mask;
    KEYPAD_REGISTER(DIR, pin) |= pin_mask;
}

inline void deactivateColumn(uint8_t pin)
{
    uint8_t pin_mask = pgm_read_byte(PIN_MASK + pin);
    KEYPAD_REGISTER(DIR, pin) &= ~pin_mask;
    KEYPAD_REGISTER(OUT, pin) |= pin_mask;
}

inline bool readRow(uint8_t pin)
{
    uint8_t pin_mask = pgm_read_byte(PIN_MASK + pin);
    return KEYPAD_REGISTER(IN, pin) & pin_mask;
}

struct KeypadSettings
{
    uint8_t c0;
    uint8_t c1;
    uint8_t c2;
    uint8_t r0;
    uint8_t r1;
    uint8_t r2;
    uint8_t r3;
};

// Membrane keypad
// constexpr KeypadSettings KEYPAD = { 2, 1, 0,   3, 4, 5, 6 };

constexpr KeypadSettings KEYPAD = { 4, 6, 2,   3, 1, 0, 5 };


}  // namespace



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

void Keypad::selectColumn(uint8_t column)
{
    switch (column)
    {
    case 0:
        deactivateColumn(KEYPAD.c2);
        activateColumn(KEYPAD.c0);
        break;

    case 1:
        deactivateColumn(KEYPAD.c0);
        activateColumn(KEYPAD.c1);
        break;

    case 2:
        deactivateColumn(KEYPAD.c1);
        activateColumn(KEYPAD.c2);
        break;

    default:
        deactivateColumn(KEYPAD.c0);
        deactivateColumn(KEYPAD.c1);
        deactivateColumn(KEYPAD.c2);
    }
}

uint8_t Keypad::readColumn()
{
    uint8_t column = 0;

    column |= readRow(KEYPAD.r0) ? 0x01 : 0;
    column |= readRow(KEYPAD.r1) ? 0x02 : 0;
    column |= readRow(KEYPAD.r2) ? 0x04 : 0;
    column |= readRow(KEYPAD.r3) ? 0x08 : 0;

    return column;
}

}  // namespace device


