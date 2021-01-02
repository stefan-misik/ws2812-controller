#include "application/core.hpp"

#include <avr/pgmspace.h>
namespace application
{

Text Core::text_;

Core::Core()
{
    screen_control_.setTabCount(2);
    screen_control_.setFlag(system::TabControl::TEXT_IN_PROGMEM, true);
    screen_control_.setFlag(system::TabControl::PENDING_REDRAW, true);
    screen_control_.setFlag(system::TabControl::HAS_FOCUS, true);
    screen_control_.setText(text_.getProgmemText(Text::Phrase::CONTROL_SCREEN));
}

uint8_t Core::processEvent(
        const system::Event & event,
        system::Event * new_event)
{
    if (screen_control_.isFlagSet(system::TabControl::HAS_FOCUS))
    {
        switch (screen_control_.processEvent(event, new_event))
        {
        case system::TabControl::EVENT_TAB_CHANGE:
            switch (screen_control_.currentTab())
            {
            case 0:
                screen_union_.changeScreen(ScreenUnion::Screen::CONTROL);
                screen_control_.setText(
                        text_.getProgmemText(Text::Phrase::CONTROL_SCREEN));
                clean_screen_ = true;
                break;

            case 1:
                screen_union_.changeScreen(ScreenUnion::Screen::SETTINGS);
                screen_control_.setText(
                        text_.getProgmemText(Text::Phrase::SETTINGS_SCREEN));
                clean_screen_ = true;
                break;
            }
            break;

        case system::TabControl::EVENT_NOT_PROCESSED:
            // Lose focus on tab controller
            if (system::Event::KEY_DOWN == event.type &&
                    system::KEY_DOWN == event.sdata)
            {
                screen_control_.setFlag(system::TabControl::HAS_FOCUS, false);
                screen_control_.setFlag(system::TabControl::PENDING_REDRAW,
                        true);
            }
            break;

        default:
            break;
        }
    }
    else
    {
        if (system::DisplayObject::EVENT_NOT_PROCESSED ==
                screen_union_.activeScreenObject()->processEvent(
                        event, new_event))
        {
            // Lose focus on tab controller
            if (system::Event::KEY_DOWN == event.type &&
                    system::KEY_UP == event.sdata)
            {
                screen_control_.setFlag(system::TabControl::HAS_FOCUS, true);
                screen_control_.setFlag(system::TabControl::PENDING_REDRAW,
                        true);
            }
        }
    }
    return system::DisplayObject::EVENT_PROCESSED;
}

void Core::draw(system::DrawContext & dc)
{
    // Draw screen controls, if necessary
    if (screen_control_.isFlagSet(system::TabControl::PENDING_REDRAW))
    {
        system::Rectangle orig;
        dc.changeSubDrawArea(system::Rectangle{0, 0, system::DISPLAY_WIDTH, 1},
                &orig);
        screen_control_.draw(dc);
        dc.setDrawArea(orig);
    }

    dc.changeSubDrawArea(
            system::Rectangle{0, 1,
        system::DISPLAY_WIDTH, system::DISPLAY_HEIGHT});

    if (clean_screen_)
    {
        system::DisplayObject::draw(dc);
    }

    screen_union_.activeScreenObject()->draw(dc);
}


}  // namespace application
