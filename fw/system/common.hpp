/**
 * @file
 */

#ifndef SYSTEM_COMMON_HPP_
#define SYSTEM_COMMON_HPP_

#include <stdint.h>
#include <stddef.h>

namespace system
{

enum class Key: char
{
    ENTER = '5'
};

static constexpr uint8_t DISPLAY_WIDTH = 84;
static constexpr uint8_t DISPLAY_HEIGHT = 6;

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

/**
 * @brief Representation of a single rectangle on the display
 */
struct Rectangle
{
    uint8_t left;
    uint8_t top;
    uint8_t right;
    uint8_t bottom;

    Rectangle(const Rectangle &) = default;
    Rectangle(): left(0), top(0), right(DISPLAY_WIDTH), bottom(DISPLAY_HEIGHT)
    { }
    Rectangle(uint8_t left, uint8_t top, uint8_t right, uint8_t bottom):
        left(left), top(top), right(right), bottom(bottom)
    { }

    uint8_t width() const { return right - left; }
    uint8_t height() const { return bottom - top; }
};


}  // namespace system



#endif  // SYSTEM_COMMON_HPP_
