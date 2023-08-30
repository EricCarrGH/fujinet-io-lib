        .export         _fn_io_get_scan_result
        .import         _fn_io_copy_cmd_data, _fn_io_do_bus
        .import         popa

        .include        "zeropage.inc"
        .include        "fn_macros.inc"
        .include        "fn_io.inc"
        .include        "fn_data.inc"

; void _fn_io_get_scan_result(uint8_t network_index, SSIDInfor *ssid_info)
;
; caller must supply memory location for ssidinfo to go
.proc _fn_io_get_scan_result
        axinto  ptr1            ; location to put ssidinfo into
        popa    tmp1            ; save index

        setax   #t_io_get_scan_result
        jsr     _fn_io_copy_cmd_data

        mva     tmp1, IO_DCB::daux1
        mwa     ptr1, IO_DCB::dbuflo
        jmp     _fn_io_do_bus
.endproc

.rodata
.define SIsz .sizeof(SSIDInfo)

t_io_get_scan_result:
        .byte $fc, $40, $ff, $ff, <SIsz, >SIsz, $ff, $00
