#ifndef _PART_CACHE_H_
#define _PART_CACHE_H_

namespace JTAG
{
    namespace Part_Cache
    {
        // Reads the part cache
        void read(const char *filename);
        
        // Writes the part cache
        void write(const char *filename);
        
        // Reads part descriptions from BSDL files that are newer than the part cache.
        // Returns true if any parts were loaded.
        bool update(const char *cache, const char *path);
    };
};

#endif // _PART_CACHE_H_
