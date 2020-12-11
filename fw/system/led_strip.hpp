/**
 * @file
 */

#ifndef SYSTEM_LED_STRIP_HPP_
#define SYSTEM_LED_STRIP_HPP_

#include "system/common.hpp"

namespace system
{

/**
 * @brief LED strip
 */
class LedStrip
{
public:
    static constexpr size_t MAX_LENGTH = 80;

    /**
     * @brief Single LED element
     */
    struct Led
    {
        uint8_t r;
        uint8_t g;
        uint8_t b;
    };

private:
    Led strip_[MAX_LENGTH];
    size_t length_;
};

}  // namespace system


#endif  // SYSTEM_LED_STRIP_HPP_
