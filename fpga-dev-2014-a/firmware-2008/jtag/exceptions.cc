#include <errno.h>
#include <string.h>
#include <boost/format.hpp>

#include "exceptions.h"

using namespace boost;

errno_exception::errno_exception(const std::string &msg): runtime_error(str(format("%1%: %2%") % msg % strerror(errno)))
{
    _errno = errno;
}
