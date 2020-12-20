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
        hundreth_seconds_(0),
        timestamp_(0)
    { }

private:
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
