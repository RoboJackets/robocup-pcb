#ifndef _EXCEPTIONS_H_
#define _EXCEPTIONS_H_

#include <stdexcept>

class errno_exception: public std::runtime_error
{
public:
    errno_exception(const std::string &msg);

    int get_errno() const { return _errno; }

protected:
    int _errno;
};

#endif //_EXCEPTIONS_H_
