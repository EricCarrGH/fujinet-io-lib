        .export     _fn_io_set_boot_mode
        .import     _fn_io_copy_cmd_data, _fn_io_do_bus

        .include    "zeropage.inc"
        .include    "fn_macros.inc"
        .include    "fn_data.inc"

; void _fn_io_set_boot_mode(uint8_t mode)
.proc _fn_io_set_boot_mode
        sta     tmp1    ; save mode

        setax   #t_io_set_boot_mode
        jsr     _fn_io_copy_cmd_data

        mva     tmp1, IO_DCB::daux1
        jmp     _fn_io_do_bus
.endproc

.rodata
t_io_set_boot_mode:
        .byte $d9, $00, $00, $00, $00, $00, $ff, $00