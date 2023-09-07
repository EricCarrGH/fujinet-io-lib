        .export         _fn_io_get_ssid
        .import         _fn_io_copy_cmd_data, _fn_io_do_bus

        .include        "zeropage.inc"
        .include        "fn_macros.inc"
        .include        "fn_io.inc"
        .include        "fn_data.inc"

; void _fn_io_get_ssid(NetConfig *net_config)
;
; read ssid to fn_io_net_config
.proc _fn_io_get_ssid
        axinto  ptr1

        setax   #t_io_get_ssid
        jsr     _fn_io_copy_cmd_data

        ; copy mem location to DCB, and call bus
        mwa     ptr1, IO_DCB::dbuflo
        jmp     _fn_io_do_bus
.endproc

.rodata
.define NCsz .sizeof(NetConfig)

t_io_get_ssid:
        .byte $fe, $40, <NCsz, >NCsz, $00, $00
