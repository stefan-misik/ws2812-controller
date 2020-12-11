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
    static void setOut1(uint8_t turn_on);
    static void setOut2(uint8_t turn_on);

};

}  // namespace device


#endif  // DEVICE_OUTPUT_HPP_
