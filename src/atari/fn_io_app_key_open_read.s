        .export         _fn_io_app_key_open
        .export         _fn_io_app_key_read

        .import         _fn_io_do_bus
        .import         _fn_io_error
        .import         fn_io_copy_cmd_data
        .import         popa, popax

        .include        "fn_zp.inc"
        .include        "fn_macros.inc"
        .include        "fn_data.inc"
        .include        "fn_io.inc"

; void fn_io_app_key_open(AppKeyOpen *buffer);
;
_fn_io_app_key_open:
        axinto  tmp7
        setax   #t_fn_io_open_app_key

ak_common:
        jsr     fn_io_copy_cmd_data

        mwa     tmp7, IO_DCB::dbuflo

        jsr     _fn_io_do_bus
        jmp     _fn_io_error


; void fn_io_app_key_read(AppKeyRead *buffer);
;
_fn_io_app_key_read:
        axinto  tmp7                    ; buffer location
        setax   #t_fn_io_read_app_key
        jmp     ak_common


.rodata

.define AKOsz .sizeof(AppKeyOpen)
.define AKRsz .sizeof(AppKeyRead)

t_fn_io_open_app_key:
        .byte $dc, $40, AKOsz, 0, 0, 0

t_fn_io_read_app_key:
        .byte $dd, $40, AKRsz, 0, 0, 0
