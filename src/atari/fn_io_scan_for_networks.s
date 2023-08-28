        .export         _fn_io_scan_for_networks
        .import         _fn_io_bus
        .include        "zeropage.inc"
        .include        "fn_macros.inc"

; int fn_io_scan_for_networks()
;
; returns count of networks scanned
; Uses tmp1-4 as the 4 byte buffer for scan data
.proc _fn_io_scan_for_networks
        setax   #t_io_scan_for_networks
        jsr     _fn_io_bus

        lda     tmp1
        ldx     #$00
        rts
.endproc

.rodata
t_io_scan_for_networks:
        .byte $fd, $40, <tmp1, >tmp1, $04, $00, $00, $00
