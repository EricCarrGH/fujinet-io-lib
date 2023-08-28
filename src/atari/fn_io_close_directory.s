        .export     _fn_io_close_directory

        .include    "zeropage.inc"
        .include    "fn_macros.inc"
        .include    "fn_data.inc"
        .import     _fn_io_copy_cmd_data, _fn_io_do_bus

; void fn_io_close_directory(uint8_t host_slot)
.proc _fn_io_close_directory
        sta     tmp1    ; save host_slot

        setax   #t_io_close_directory
        jsr     _fn_io_copy_cmd_data

        mva     tmp1, IO_DCB::daux1
        jmp     _fn_io_do_bus
.endproc

.rodata
t_io_close_directory:
        .byte $f5, $00, $00, $00, $00, $00, $ff, $00