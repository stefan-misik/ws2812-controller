/**
 * @file
 */

#ifndef VISUAL_LED_CHAIN_HPP_
#define VISUAL_LED_CHAIN_HPP_

#include "visual/common.hpp"

namespace visual
{

/**
 * @brief LED chain
 */
class LedChain
{
public:
    /**
     * @brief Single LED element
     */
    struct Led
    {
        uint8_t r;
        uint8_t g;
        uint8_t b;
    };

    LedChain():
        length_(0)
    { }

    uint8_t length() const { return length_; }

    Led * begin() { return chain_; }
    const Led * begin() const { return chain_; }

    /**
     * @brief Modify the led chain to contain the raw data for the LEDs
     *
     * This function takes individual RGB sub-pixels, post-processes them, and
     * places them in correct order modifying its own buffer.
     *
     * @param[out] buffer Pointer to the variable which will obtain pointer to
     *             raw buffer containing LED data
     *
     * @return Number of bytes to be read from the raw buffer
     */
    size_t render(uint8_t ** buffer);

private:
    Led chain_[MAX_CHAIN_LENGTH];
    uint8_t length_;
};

}  // namespace visual


#endif  // VISUAL_LED_CHAIN_HPP_
