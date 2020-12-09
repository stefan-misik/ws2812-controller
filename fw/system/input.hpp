/**
 * @file
 */

#ifndef SYSTEM_INPUT_HPP_
#define SYSTEM_INPUT_HPP_

#include "system/common.hpp"
#include "system/event_queue.hpp"
#include "tools/button_filter.hpp"

namespace system
{

/**
 * @brief Input system component
 */
class Input
{
public:
    Input(EventQueue * receiver):
        receiver_(receiver)
    {
        reset();
    }

    /** @brief Reset all the buttons */
    void reset();

    /**
     * @brief Update the keypad state
     *
     * This method is to be called periodically with new button states.
     *
     * @param column_number Number of the column to be updated
     * @param keys States of the keys in the column
     */
    void update(uint8_t column, uint8_t keys);

    /**
     * @brief Check whether given key is pressed
     *
     * @param key Character of the key to be checked
     * @return The key is being held in pressed state
     */
    bool isPressed(char key) const;

private:
    tools::ButtonFilter keys_[12];
    EventQueue * receiver_;
};


}  // namespace system




#endif  // SYSTEM_INPUT_HPP_
