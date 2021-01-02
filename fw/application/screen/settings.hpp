/**
 * @file
 */

#ifndef APPLICATION_SCREENS_SETTINGS_HPP_
#define APPLICATION_SCREENS_SETTINGS_HPP_

#include "system/display_object.hpp"

namespace application
{

class SettingsScreen:
        public system::DisplayObject
{
public:
    /** @copydoc system::DisplayObject::processEvent() */
    uint8_t processEvent(
            const system::Event & event,
            system::Event * new_event) override;

    /** @copydoc system::DisplayObject::draw() */
    void draw(system::DrawContext & dc) override;
};

}  // namespace application



#endif  // APPLICATION_SCREENS_SETTINGS_HPP_
