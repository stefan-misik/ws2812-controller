cmake_minimum_required(VERSION 3.13)

set(PROJ led_controller)
set(PICO_BOARD "pico_w")

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

project(${PROJ} C CXX ASM)

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

add_executable(${PROJ} main.cpp)
target_link_libraries(${PROJ} pico_stdlib)
pico_add_extra_outputs(${PROJ})
pico_enable_stdio_usb(${PROJ} 1)
pico_enable_stdio_uart(${PROJ} 0)

