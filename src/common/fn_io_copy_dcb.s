        .export         fn_io_copy_dcb

        .include        "zeropage.inc"
        .include        "fn_macros.inc"
        .include        "fn_data.inc"

; Sets DCB data from given table address
; Trashes ptr4 as only ZP location
.proc fn_io_copy_dcb
        axinto  ptr4    ; the table of dcb bytes to insert

        ; first 2 bytes always $70, $01, so we can do those manually. saves table space, and loops
        mva     #$70, IO_DCB::ddevic
        mva     #$01, IO_DCB::dunit

        ; copy bytes of table into DCB
        ldy     #7      ; 8 bytes to copy
l1:
        ldx     dcb_offsets, y
        mva     {(ptr4), y}, {IO_DCB::ddevic, x}
        dey
        bpl     l1

        ; almost all devices use $0f
        mva     #$0f, IO_DCB::dtimlo

        rts
.endproc

.rodata
; which DCB entries to write to, indexed from DDEVIC
dcb_offsets: .byte 2, 3, 4, 5, 8, 9, 10, 11
