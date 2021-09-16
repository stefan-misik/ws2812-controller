/**
 * @file
 */

#ifndef SYSTEM_CONTROLS_MENU_HPP_
#define SYSTEM_CONTROLS_MENU_HPP_

#include "system/control.hpp"

namespace system
{

class MenuControl:
        public Control
{
public:
    enum EventResult: uint8_t
    {
        EVENT_MENU_CHANGE = DisplayObject::EventResult::EVENT_USER_RESULT + 0,
        EVENT_MENU_SELECT = DisplayObject::EventResult::EVENT_USER_RESULT + 1
    };

    /** @copydoc system::DisplayObject::processEvent() */
    uint8_t processEvent(
            const system::Event & event,
            system::Event * new_event) override;
    /** @copydoc system::DisplayObject::draw() */
    void draw(system::DrawContext & dc) override;

private:
};

}  // namespace system



#endif  // SYSTEM_CONTROLS_MENU_HPP_
