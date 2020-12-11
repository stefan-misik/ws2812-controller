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
        length_(0),
        is_on_(false)
    { }

    uint8_t length() const { return length_; }
    Led * begin() { return chain_; }
    const Led * begin() const { return chain_; }
    bool isOn() const { return is_on_; }

    /**
     * @brief Render the led strip into a buffer
     *
     * This function takes individual RGB sub-pixels, post-processes them, and
     * places them in correct order into provided buffer.
     *
     * @param[out] buffer Buffer which will obtain the LED strip contents. The
     *             buffer needs to be of sufficient size to obtain states of all
     *             sub-pixels, i.e. MAX_CHAIN_LENGTH * 3.
     *
     * @return Number of bytes actually written into the buffer
     */
    size_t render(uint8_t * buffer);

private:
    Led chain_[MAX_CHAIN_LENGTH];
    uint8_t length_;
    bool is_on_;
};

}  // namespace visual


#endif  // VISUAL_LED_CHAIN_HPP_
