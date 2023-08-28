        .export _fn_io_dosiov

        .import fn_io_copy_dcb
        .include "c64.inc"

; void fn_io_dosiov()
;
; This one is the implementation for the device that initiates the actual SIO
.proc _fn_io_dosiov
        ; TODO: what is the c64 SIOV?
        rts
.endproc