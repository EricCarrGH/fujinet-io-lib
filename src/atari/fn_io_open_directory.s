        .export     _fn_io_open_directory

        .import     _fn_io_copy_cmd_data, _fn_io_do_bus
        .import     popa, return0

        .include    "zeropage.inc"
        .include    "fn_macros.inc"
        .include    "fn_data.inc"

; int _fn_io_open_directory(uint8_t host_slot, void *buffer)
;
.proc _fn_io_open_directory
        axinto  ptr1            ; buffer save location
        popa    tmp1            ; save the host_slot

        setax   #t_io_open_directory
        jsr     _fn_io_copy_cmd_data

        ; set the host_slot into DAUX1, and buffer in dbuflo
        mva     tmp1, IO_DCB::daux1
        mwa     ptr1, IO_DCB::dbuflo

        jsr     _fn_io_do_bus
        jmp     return0

.endproc

.rodata
t_io_open_directory:
        .byte $f7, $80, $ff, $ff, $00, $01, $ff, $00
