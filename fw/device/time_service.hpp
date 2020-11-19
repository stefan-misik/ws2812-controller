/**
 * @file
 */

#ifndef DEVICE_TIME_SERVICE_HPP_
#define DEVICE_TIME_SERVICE_HPP_

#include <stdint.h>

namespace device
{

class TimeService
{
public:
    /** @brief Initialize the time service */
    static void initialize();

    /**
     * @brief Get the current time
     *
     * @return Time in 2.5 milliseconds
     */
    static uint8_t getTime()
    {
        return current_time_;
    }

    /** @brief Current time in 2.5 milliseconds */
    static volatile uint8_t current_time_;
};

}  // device

#endif  // DEVICE_TIME_SERVICE_HPP_
