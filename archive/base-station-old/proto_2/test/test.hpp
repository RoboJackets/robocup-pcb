#ifndef _TEST_HPP_
#define _TEST_HPP_

#include "USB_Device.hpp"

#define Forward_Size    28
#define Reverse_Size    11

extern USB_Device *dev;

// Parameter is which base station to use
bool test_init(int n = 0);

void send_motors(int m0, int m1, int m2, int m3, int m4);

#endif // _TEST_HPP_
