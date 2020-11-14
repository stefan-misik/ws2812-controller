/**
 * @file
 */

#ifndef DEVICE_OUTPUT_HPP_
#define DEVICE_OUTPUT_HPP_

#include <stdint.h>

namespace device
{

class Output
{
public:
    /** @brief Initialize the outputs */
    static void initialize();

    static void setLed(uint8_t brightness);
    static void setBacklight(uint8_t brightness);
    static void setOut1(bool turn_on);
    static void setOut2(bool turn_on);

};

}  // namespace device


#endif  // DEVICE_OUTPUT_HPP_
