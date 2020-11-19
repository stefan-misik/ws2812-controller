#include "system/input.hpp"

#include <avr/pgmspace.h>


namespace system
{

static const char keypad_layout[12] PROGMEM =
{
    '*', '7', '4', '1',
    '0', '8', '5', '2',
    '#', '9', '6', '3'
};

tools::ButtonFilter Input::buttons_[12];


void Input::initialize()
{
    device::Keypad::initialize();

    for (auto & button_filter: buttons_)
    {
        button_filter.reset();
    }
}

void Input::read(uint8_t current_column, uint8_t next_column)
{
    uint8_t keys = device::Keypad::readColumn();
    device::Keypad::selectColumn(next_column);

    tools::ButtonFilter * current_button = &(buttons_[4 * current_column]);
    for (uint8_t row = 0; row < 4; ++row)
    {
        current_button->updateButton(!(keys & 0x01));
        ++current_button;
        keys >>= 1;
    }
}

}  // namespace system
