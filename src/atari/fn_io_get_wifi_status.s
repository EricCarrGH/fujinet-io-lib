        .export         _fn_io_get_wifi_status
        .import         _fn_io_copy_cmd_data, _fn_io_do_bus

        .include        "zeropage.inc"
        .include        "fn_macros.inc"
        .include        "fn_data.inc"

; bool fn_io_get_wifi_status()
;
; Return values are:
;  1: No SSID available
;  3: Connection Successful
;  4: Connect Failed
;  5: Connection lost
.proc _fn_io_get_wifi_status
        setax   #t_io_get_wifi_status
        jsr     _fn_io_copy_cmd_data
        mwa     #tmp4, IO_DCB::dbuflo
        jsr     _fn_io_do_bus

        ldx     #$00
        lda     tmp4
        rts
.endproc

.rodata
t_io_get_wifi_status:
        .byte $fa, $40, $01, $00, $00, $00