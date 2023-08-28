                .export   _fn_io_do_bus

                .include  "fn_data.inc"

; This is the implementation of the only device specific function required for fn_io.
; Everything else is board agnostic (other than an expectation of the DDEVIC structure for calling FN)
; and calls through here to reach BUS

.proc _fn_io_do_bus
        jmp     BUS
.endproc