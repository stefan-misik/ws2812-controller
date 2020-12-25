#include "tools/button_filter.hpp"

namespace tools
{

void ButtonFilter::updateButton(bool button_state)
{
    if (button_state)
    {
        // Count up
        if (counter_ < NEXT_REPEAT_THRESHOLD)
        {
            ++counter_;
        }
        else
        {
            counter_ = REPEAT_THRESHOLD;
        }
    }
    else
    {
        // Count down
        if (counter_ > PRESS_THRESHOLD)
        {
            counter_ = PRESS_THRESHOLD;
        }
        else if (counter_ > 0)
        {
            --counter_;
        }
    }

    updateState();
}

void ButtonFilter::updateState()
{
    bool old_pressed = (state_ & PRESSED);
    uint8_t press_count = pressCount();
    uint8_t new_state = 0;

    if (0 == counter_)
    {
        if (old_pressed)
        {
            new_state |= UP;
            press_count = 0;
        }
    }
    else if (counter_ >= PRESS_THRESHOLD)
    {
        new_state |= PRESSED;

        // This condition could use counter comparison to PRESS_THRESHOLD,
        // however following has more stable behavior, as it won't cause erratic
        // presses (and button down events) in case the button is momentarily
        // released (e.g. just for one update period).
        if (!old_pressed)
        {
            new_state |= DOWN;
            press_count = 0;
        }
        else if (REPEAT_THRESHOLD == counter_)
        {
            // This is branch is also taken in update cycle when
            // NEXT_REPEAT_THRESHOLD is reached, see countUp()
            new_state |= DOWN;

            // Count-up the count of button presses and saturate at the maximum
            // value.
            press_count += 1;
            if (press_count > MAX_PRESS_COUNT)
            {
                press_count = MAX_PRESS_COUNT;
            }
        }
    }
    else if (old_pressed)
    {
        new_state |= PRESSED;
    }

    // Press count counter is properly saturated to prevent mixing with the
    // state flag bits.
    state_ = press_count | new_state;
}

}  // namespace tools
