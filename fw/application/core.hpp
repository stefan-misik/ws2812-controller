/**
 * @file
 */

#ifndef APPLICATION_CORE_HPP_
#define APPLICATION_CORE_HPP_

#include "system/display_object.hpp"
#include "system/controls/tab.hpp"
#include "application/screen_union.hpp"
#include "application/settings.hpp"
#include "application/text.hpp"

namespace application
{

class Core:
        public system::DisplayObject
{
public:
    Core();

    /** @copydoc system::DisplayObject::processEvent() */
    uint8_t processEvent(
            const system::Event & event,
            system::Event * new_event) override;
    /** @copydoc system::DisplayObject::draw() */
    void draw(system::DrawContext & dc, uint8_t time) override;

    static Text & text() { return text_; }

private:
    static Text text_;
    bool clean_screen_ = true;

    system::TabControl screen_control_;
    ScreenUnion screen_union_;
};

}  // namespace application


#endif  // APPLICATION_CORE_HPP_
