/**
 * @file
 */

#ifndef TOOLS_BUTTON_FILTER_H_
#define TOOLS_BUTTON_FILTER_H_

#include <stdint.h>

namespace tools
{

class ButtonFilter
{
public:
    enum State
    {
        /** @brief Indicates current state of the button */
        PRESSED = 0x20,
        /** @brief Set in an update cycle when the button is pressed */
        DOWN = 0x40,
        /** @brief Set in an update cycle when the button is released */
        UP = 0x80,
    };

    /**
     * @brief Maximum number of repeated presses of a button that can be
     *        reported
     */
    static constexpr uint8_t MAX_PRESS_COUNT = 0x1f;

    ButtonFilter():
        counter_(0),
        state_(0)
    { }

    /** @brief Reset the button filter */
    void reset()
    {
        counter_ = 0;
        state_ = 0;
    }

    /**
     * @brief Update the state of the button filter with current state of the
     *        button
     *
     * This method shall be called periodically each couple of milliseconds to
     * filter the button states and generate button press events.
     *
     * @param button_state Current button state
     */
    void updateButton(bool button_state);

    /**
     * @brief Get the current state of the button
     *
     * @return Bitwise or of values from @ref State
     */
    uint8_t state() const
    {
        return state_ & (PRESSED | DOWN | UP);
    }

    /**
     * @brief Get the number of repeated button press down events generated
     *
     * @return Number of repeated press down events, the value saturates at
     *         @ref MAX_PRESS_COUNT value
     */
    uint8_t pressCount() const
    {
        return state_ & MAX_PRESS_COUNT;
    }

private:
    static constexpr uint8_t PRESS_THRESHOLD = 5;
    static constexpr uint8_t REPEAT_THRESHOLD = PRESS_THRESHOLD + 50;
    static constexpr uint8_t NEXT_REPEAT_THRESHOLD = REPEAT_THRESHOLD + 8;

    uint8_t counter_;
    uint8_t state_;

    void updateState();
};

}  // namespace tools


#endif  // TOOLS_BUTTON_FILTER_H_
