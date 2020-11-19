/**
 * @file
 */

#ifndef DEVICE_KEYPAD_HPP_
#define DEVICE_KEYPAD_HPP_

#include <stdint.h>

namespace device
{

/**
 * @brief Low level driver for accessing matrix keypad
 */
class Keypad
{
public:
    /** @brief Initialize the keypad driver */
    static void initialize();

    /**
     * @brief Select the column in the dot matrix keyboard
     *
     * To save some resources, this functions expects the columns to be selected
     * in order: 0, 1, 2, 0, 1, etc.
     *
     * @param column Column number in range from 0 to 2
     */
    static void selectColumn(uint8_t column);

    /**
     * @brief Read the pressed buttons in the column
     *
     * @return Lower nibble represents states of the buttons in the currently
     *         selected column - 0 = pressed, 1 = released
     */
    static uint8_t readColumn();
};

}  // namespace device


#endif  // DEVICE_KEYPAD_HPP_
