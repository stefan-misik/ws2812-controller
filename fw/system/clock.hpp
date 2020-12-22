/**
 * @file
 */

#ifndef SYSTEM_CLOCK_HPP_
#define SYSTEM_CLOCK_HPP_

#include "system/common.hpp"

namespace system
{

class Core;

class Clock
{
public:
    Clock():
        previous_increment_(0),
        hundreth_seconds_(0),
        timestamp_(0)
    { }

    /**
     * @brief Get the binary time keeping counter in 10 milliseconds
     *
     * @return Current value of 10 millisecond-time
     */
    uint8_t hunderethSeconds() const { return hundreth_seconds_; }

private:
    uint8_t previous_increment_;
    uint8_t hundreth_seconds_;
    uint64_t timestamp_;

    /**
     * @brief Call this method periodically every 10ms
     */
    void tick();

    friend class Core;
};

}  // namespace system



#endif  // SYSTEM_CLOCK_HPP_
