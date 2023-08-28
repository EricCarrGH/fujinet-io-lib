        .export _fn_io_do_bus

        .include "c64.inc"

; void fn_io_do_bus()
;
; This one is the implementation for the device that initiates the actual BUS
.proc _fn_io_do_bus
        ; TODO: what is the c64 BUS?
        rts
.endproc