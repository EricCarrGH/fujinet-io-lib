        .export     _fn_io_close_directory

        .include    "zeropage.inc"
        .include    "fn_macros.inc"
        .import     _fn_io_bus

; void fn_io_close_directory(void)
.proc _fn_io_close_directory
        setax   #t_io_close_directory
        jmp     _fn_io_bus
.endproc

.rodata
t_io_close_directory:
        .byte $f5, $00, $00, $00, $00, $00
