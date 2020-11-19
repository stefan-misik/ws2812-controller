/**
 * @file
 */

#ifndef SYSTEM_INPUT_HPP_
#define SYSTEM_INPUT_HPP_

#include "device/keypad.hpp"
#include "tools/button_filter.hpp"

#include <stdint.h>

namespace system
{

/**
 * @brief Input system component
 */
class Input
{
public:
    /** @brief Initialize the hardware and input component */
    static void initialize();

    /**
     * @brief Read the states of the individual keys
     *
     * @param current_column Currently selected key column (value 0 through 2)
     * @param next_column Key column to be selected next (value 0 through 2)
     */
    static void read(uint8_t current_column, uint8_t next_column);

    static tools::ButtonFilter buttons_[12];
};


}  // namespace system




#endif  // SYSTEM_INPUT_HPP_
