#include <stdio.h>
#include <string.h>

#include "ft2232.h"
#include "bit_rev.h"

class SPI_Flash
{
public:
    SPI_Flash(JTAG::HW &hw);
    
    uint16_t rdid();
    
    void wren();
    void bulk_erase();
    uint8_t status();
    
    // buf must be bit-reversed.
    void write(unsigned int offset, uint8_t *buf, unsigned int len);
    void read(unsigned int offset, uint8_t *buf, unsigned int len);
    
    // Waits for WIP to go low
    void wait();

protected:
    JTAG::HW &hw;
};

SPI_Flash::SPI_Flash(JTAG::HW &hw): hw(hw)
{
}

uint16_t SPI_Flash::rdid()
{
    hw.tms(false);
    uint8_t cmd[8] = {bit_rev[0x9f]};
    hw.shift_data(cmd, 0, 8, false);
    uint8_t id[2] = {0};
    hw.shift_data(0, id, 16, false);
    hw.tms(true);
    
    return (bit_rev[id[0]] << 8) | bit_rev[id[1]];
}

void SPI_Flash::wren()
{
    hw.tms(false);
    uint8_t cmd = bit_rev[0x06];
    hw.shift_data(&cmd, 0, 8, false);
    hw.tms(true);
}

uint8_t SPI_Flash::status()
{
    hw.tms(false);
    uint8_t cmd = bit_rev[0x05];
    hw.shift_data(&cmd, 0, 8, false);
    uint8_t status = 0;
    hw.shift_data(0, &status, 8, false);
    hw.tms(true);
    
    return bit_rev[status];
}

void SPI_Flash::bulk_erase()
{
    wren();
    
    hw.tms(false);
    uint8_t cmd = bit_rev[0xc7];
    hw.shift_data(&cmd, 0, 8, false);
    hw.tms(true);

    wait();
}

void SPI_Flash::wait()
{
    hw.tms(false);
    uint8_t cmd = bit_rev[0x05];
    hw.shift_data(&cmd, 0, 8, false);
    
    uint8_t status;
    do
    {
        hw.shift_data(0, &status, 8, false);
        status = bit_rev[status];
    } while (status & 1);
    
    hw.tms(true);
}

void SPI_Flash::write(unsigned int offset, uint8_t *buf, unsigned int len)
{
    wren();
    
    hw.tms(false);
    
    uint8_t cmd[4] = {0x02, offset >> 16, offset >> 8, offset};
    for (unsigned int i = 0; i < sizeof(cmd); ++i)
    {
        cmd[i] = bit_rev[cmd[i]];
    }
    hw.shift_data(cmd, 0, 8 * sizeof(cmd), false);
    hw.shift_data(buf, 0, 8 * len, false);
    
    hw.tms(true);
    
    wait();
}

void SPI_Flash::read(unsigned int offset, uint8_t *buf, unsigned int len)
{
    hw.tms(false);
    
    uint8_t cmd[5] = {0x0b, offset >> 16, offset >> 8, offset, 0};
    for (unsigned int i = 0; i < sizeof(cmd); ++i)
    {
        cmd[i] = bit_rev[cmd[i]];
    }
    hw.shift_data(cmd, 0, 8 * sizeof(cmd), false);
    hw.shift_data(0, buf, 8 * len, false);
    
    hw.tms(true);
}

void write_file(SPI_Flash &spi, const char *filename)
{
    printf("Erasing...");
    fflush(stdout);
    
    spi.bulk_erase();
    
    printf("done\n");
    
    FILE *fp = fopen(filename, "rb");
    if (!fp)
    {
        printf("Can't open %s: %m\n", filename);
        return;
    }

    uint8_t buf[256];
    unsigned int offset = 0;
    while (!feof(fp))
    {
        int n = fread(buf, 1, 256, fp);
        
        // Pad out with FF's
        for (; n < 256; ++n)
        {
            buf[n] = 0xff;
        }
        
        for (int i = 0; i < 256; ++i)
        {
            buf[i] = bit_rev[buf[i]];
        }
        
        printf("\rWriting: %06x", offset);
        fflush(stdout);
        
        spi.write(offset, buf, 256);
        offset += 256;
    }
    fclose(fp);
    printf("\n");
}

void read_file(SPI_Flash &spi, const char *filename)
{
    FILE *fp = fopen(filename, "wb");
    if (!fp)
    {
        printf("Can't open %s: %m\n", filename);
        return;
    }

    uint8_t buf[256];
    for (unsigned int offset = 0; offset < 131072; offset += 256)
    {
        printf("\rReading: %06x", offset);
        fflush(stdout);
        
        spi.read(offset, buf, 256);
        
        for (int i = 0; i < 256; ++i)
        {
            buf[i] = bit_rev[buf[i]];
        }
        
        fwrite(buf, 1, 256, fp);
    }
    fclose(fp);
    printf("\n");
}

int main(int argc, char *argv[])
{
    JTAG::FT2232 hw(0x0403, 0x6010);
    SPI_Flash spi(hw);

    printf("ID %04x\n", spi.rdid());
    
    if (argc != 3)
    {
        printf("Usage: spi [-r|-w] filename\n");
        return 1;
    }

    if (!strcmp(argv[1], "-r"))
    {
        read_file(spi, argv[2]);
    }

    if (!strcmp(argv[1], "-w"))
    {
        write_file(spi, argv[2]);
    }

    return 0;
}
