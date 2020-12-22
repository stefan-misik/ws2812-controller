#include "application/root_screen.hpp"

inline void * operator new(size_t size, void * ptr)
{
    return ptr;
}

namespace application
{

RootScreen::RootScreen():
        active_screen_(Screen::STARTUP)
{
    new (screen_data_) StartupScreen();
}

uint8_t RootScreen::processEvent(
        const system::Event & event,
        system::Event * new_event)
{
    return activeScreen()->processEvent(event, new_event);
}

void RootScreen::draw(system::DrawContext & dc, uint8_t time)
{
    dc.drawText(0, 0, "Test");
    dc.changeSubDrawArea(
            system::Rectangle{0, 1,
        system::DISPLAY_HEIGHT, system::DISPLAY_HEIGHT});
    activeScreen()->draw(dc, time);
}

void RootScreen::changeScreen(Screen new_screen)
{
    activeScreen()->~DisplayObject();

    switch (new_screen)
    {
    case Screen::STARTUP:
        new (screen_data_) StartupScreen();
        break;

    case Screen::CONTROL:
        new (screen_data_) ControlScreen();
        break;

    case Screen::SETTINGS:
        new (screen_data_) SettingsScreen();
        break;
    }

    active_screen_ = new_screen;
}

}  // namespace application
