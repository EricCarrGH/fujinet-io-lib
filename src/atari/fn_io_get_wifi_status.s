        .export         _fn_io_get_wifi_status
        .import         _fn_io_bus

        .include        "zeropage.inc"
        .include        "fn_macros.inc"

; bool fn_io_get_wifi_status()
;
; Return values are:
;  1: No SSID available
;  3: Connection Successful
;  4: Connect Failed
;  5: Connection lost
.proc _fn_io_get_wifi_status
        setax   #t_io_get_wifi_status
        jsr     _fn_io_bus

        lda     tmp1
        ldx     #$00
        rts
.endproc

.rodata
t_io_get_wifi_status:
        .byte $fa, $40, <tmp1, >tmp1, $01, $00, $00, $00