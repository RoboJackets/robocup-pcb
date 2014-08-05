cmake_minimum_required(VERSION 2.4)

project(test)

add_definitions(-O2 -Wall -g3)

set(COMMON_SRCS test_common.cpp USB_Device.cpp)
set(COMMON_LIBS usb pthread)

add_executable(test test.cpp ${COMMON_SRCS})
target_link_libraries(test ${COMMON_LIBS})

add_executable(step step.cpp ${COMMON_SRCS})
target_link_libraries(step ${COMMON_LIBS})

add_executable(pd-learn pd-learn.cpp ${COMMON_SRCS})
target_link_libraries(pd-learn ${COMMON_LIBS})
