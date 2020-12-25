/**
 * @file
 */

#ifndef SYSTEM_COMMON_HPP_
#define SYSTEM_COMMON_HPP_

#include <stdint.h>
#include <stddef.h>

namespace system
{

enum Key: char
{
    KEY_ENTER = '5',
    KEY_UP = '2',
    KEY_DOWN = '8',
    KEY_LEFT = '4',
    KEY_RIGHT = '6',
    KEY_OK = '#',
    KEY_CLEAR = '*'
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
        RESERVED = 0,

        /**
         * @brief Key press or repeated key press detected
         *
         * * `sdata` - Key that was pressed
         * * `ldata` - Repeated key press count, starting from 0 and saturating
         *             at 31
         */
        KEY_DOWN,

        /**
         * @brief A key was released
         *
         * * `sdata` - Key that was released
         * * `ldata` - Ignored, should be zero
         */
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
