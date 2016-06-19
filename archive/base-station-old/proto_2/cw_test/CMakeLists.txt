set(PROJECT test)
cmake_minimum_required(VERSION 2.6)

project(${PROJECT})

add_definitions(-O2 -Wall -g3)

find_package(Qt4 REQUIRED)
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include(${QT_USE_FILE})

set(SRCS
    main.cpp USB_Device.cpp Main_Window.cpp
)

set(UIS
    main_window.ui
)

qt4_wrap_cpp(MOC_SRCS
    Main_Window.hpp
)

qt4_wrap_ui(UIHS ${UIS})
add_executable(${PROJECT} ${SRCS} ${MOC_SRCS} ${UIHS})
target_link_libraries(${PROJECT} ${QT_LIBRARIES} usb)
