/**
 * @file
 */

#ifndef SYSTEM_COMMON_HPP_
#define SYSTEM_COMMON_HPP_

#include <stdint.h>

namespace system
{

enum class Message: uint8_t
{
    KEY_DOWN,
    KEY_PRESS,
    KEY_UP
};

enum class Key: char
{
    ENTER = '5'
};


}  // namespace system



#endif  // SYSTEM_COMMON_HPP_
