#include <stdint.h>
#include <string.h>
#include <cbm.h>
#include "fn_io.h"
#include "fn_data.h"

void fn_io_set_device_filename(uint8_t mode, uint8_t host_slot, uint8_t device_slot, void *buffer)
{
    memset(response, 0, sizeof(response));

    response[0] = FUJICMD_SET_DEVICE_FULLPATH;
    response[1] = device_slot;
    response[2] = host_slot;
    response[3] = mode;
    strcpy((char *)&response[4], buffer);

    cbm_open(LFN, DEV, SAN, response);
    cbm_close(LFN);
}
