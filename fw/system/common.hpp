/**
 * @file
 */

#ifndef SYSTEM_COMMON_HPP_
#define SYSTEM_COMMON_HPP_

#include <stdint.h>

namespace system
{

/**
 * @brief ID of a single tile used
 */
using TileId = uint8_t;


enum class Key: char
{
    ENTER = '5'
};

struct Rectangle
{
    uint8_t left;
    uint8_t top;
    uint8_t right;
    uint8_t bottom;
};

struct Tile
{
    typedef int8_t (*TileProcedure)(uint8_t message_type, char * data);

    Tile * next_tile;
    TileId parent;
    TileId first_child;
    Rectangle position;

    TileProcedure procedure;
    void * opaque;
};


/**
 * @brief Event message passed among the system components
 */
struct Message
{
    enum MessageType: uint8_t
    {
        KEY_DOWN,
        KEY_PRESS,
        KEY_UP,

        USER = 128
    };

    TileId target;
    uint8_t type;
    char data[4];
};

static constexpr TileId INVALID_TILE = 255;


}  // namespace system



#endif  // SYSTEM_COMMON_HPP_
