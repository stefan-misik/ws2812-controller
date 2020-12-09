/**
 * @file
 */

#ifndef SYSTEM_COMMON_HPP_
#define SYSTEM_COMMON_HPP_

#include <stdint.h>

namespace system
{

enum class Key: char
{
    ENTER = '5'
};

/**
 * @brief Event message passed among the system components
 */
struct Event
{
    enum MessageType: uint8_t
    {
        KEY_DOWN,
        KEY_PRESS,
        KEY_UP,

        USER = 128
    };

    uint8_t type;

    uint8_t sdata;
    uintptr_t ldata;
};


}  // namespace system



#endif  // SYSTEM_COMMON_HPP_
