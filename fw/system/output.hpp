/**
 * @file
 */

#ifndef SYSTEM_OUTPUT_HPP_
#define SYSTEM_OUTPUT_HPP_

#include "system/common.hpp"

namespace system
{

class Output
{
public:
    enum class Type
    {
        LED,  /**< PWM controlled LED on the board */
        BACKLIGHT,  /**< PWM controllable backlight of the LCD */
        OUT1,  /**< Digital output 1 */
        OUT2   /**< Digital output 2 */
    };

    Output(Type type):
        setter_fn_(typeToSetterFn(type))
    { }

    /**
     * @brief Set the the state of the output
     *
     * @param value 0 to 255 for PWM outputs, 0/any other for digital outputs
     */
    void set(uint8_t value)
    {
        setter_fn_(value);
    }

private:
    typedef void (*Setter)(uint8_t);

    Setter setter_fn_;

    static Setter typeToSetterFn(Type type);
};

}  // namespace system


#endif  // SYSTEM_OUTPUT_HPP_
