        .export _fn_io_bus

        .import fn_io_copy_dcb, _fn_io_do_bus

; void _fn_io_bus(dcb_table)
;
; Sets DCB data from passed in dcb_table and calls BUS
.proc _fn_io_bus
        jsr     fn_io_copy_dcb
        jmp     _fn_io_do_bus
.endproc
