/**
 * @file
 */

#ifndef SYSTEM_CONTROL_HPP_
#define SYSTEM_CONTROL_HPP_

#include "system/common.hpp"
#include "system/display_object.hpp"

namespace system
{

class Control:
        public DisplayObject
{
public:
    enum Flags: uint8_t
    {
        HAS_FOCUS = (1 << 0),
        PENDING_REDRAW = (1 << 1),

        USER_FLAGS = (1 << 4),
    };

    bool isFlagSet(uint8_t flag) const
    {
        return flags_ & flag;
    }

    void setFlag(uint8_t flag, bool value);

protected:
    uint8_t flags_ = 0;
};

}  // namespace system




#endif  // SYSTEM_CONTROL_HPP_
