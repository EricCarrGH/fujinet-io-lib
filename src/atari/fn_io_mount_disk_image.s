        .export         _fn_io_mount_disk_image
        .import         _fn_io_copy_cmd_data, popa, _fn_io_do_bus

        .include        "zeropage.inc"
        .include        "fn_macros.inc"
        .include        "fn_data.inc"

; void fn_io_mount_disk_image(uint8_t device_slot, uint8_t mode)
.proc _fn_io_mount_disk_image
        sta     tmp1    ; save mode
        popa    tmp2    ; save slot

        setax   #t_io_mount_disk_image
        jsr     _fn_io_copy_cmd_data

        mva     tmp2, IO_DCB::daux1
        mva     tmp1, IO_DCB::daux2
        mva     #$fe, IO_DCB::dtimlo
        jmp     _fn_io_do_bus
.endproc

.rodata
t_io_mount_disk_image:
        .byte $f8, $00, $00, $00, $ff, $ff