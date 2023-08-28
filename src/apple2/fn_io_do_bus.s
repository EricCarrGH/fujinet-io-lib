        .export _fn_io_do_bus

        .import fn_io_copy_dcb
        .include "apple2.inc"

; void fn_io_do_bus()
;
; This one is the implementation for the device that initiates the actual bus
.proc _fn_io_do_bus
        ; TODO: what is apple2 BUS?
        rts
.endproc