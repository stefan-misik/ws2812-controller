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

void Input::reset()
{
    for (auto & key: keys_)
    {
        key.reset();
    }
}

void Input::update(uint8_t column, uint8_t keys)
{
    const uint8_t first_key = 4 * column;
    const uint8_t key_end = first_key + 4;
    for (uint8_t key = first_key; key != key_end; ++key)
    {
        tools::ButtonFilter * const key_filter = &(keys_[key]);
        key_filter->updateButton(!(keys & 0x01));
        const uint8_t key_state = key_filter->state();
        const uint8_t key_char = pgm_read_byte(&(keypad_layout[key]));

        if (key_state & tools::ButtonFilter::DOWN)
        {
            receiver_->insert(Event{Event::KEY_DOWN, key_char, 0});
        }
        else if (key_state & tools::ButtonFilter::UP)
        {
            receiver_->insert(Event{Event::KEY_UP, key_char, 0});
        }

        if (key_state & tools::ButtonFilter::PRESS)
        {
            receiver_->insert(Event{Event::KEY_PRESS, key_char, 0});
        }

        keys >>= 1;
    }
}

bool Input::isPressed(char key) const
{
    uint8_t key_id = 0;
    const uint8_t key_end = sizeof(keypad_layout);
    for (; key_id != key_end; ++key_id)
    {
        if (key == pgm_read_byte(keypad_layout + key_id))
        {
            break;
        }
    }

    if (key_id >= key_end)
    {
        return false;
    }

    return keys_[key_id].state() & tools::ButtonFilter::PRESSED;
}

}  // namespace system
