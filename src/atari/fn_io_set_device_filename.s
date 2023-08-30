        .export         _fn_io_set_device_filename
        .import         _fn_io_copy_cmd_data, _fn_io_do_bus
        .import         popa

        .include        "zeropage.inc"
        .include        "fn_macros.inc"
        .include        "fn_data.inc"


; void _fn_io_set_device_filename(uint8_t mode, uint8_t host_slot, uint8_t device_slot, char *buffer)
.proc _fn_io_set_device_filename
        axinto  ptr1    ; buffer
        popa    tmp1    ; device_slot
        popa    tmp2    ; host_slot
        popa    tmp3    ; mode

        setax   #t_io_set_device_filename
        jsr     _fn_io_copy_cmd_data

        ; setup aux2 = host_slot * 16 + mode
        lda     tmp2
        beq     :+
        asl     a
        asl     a
        asl     a
        asl     a
:       clc
        adc     tmp3
        sta     IO_DCB::daux2

        mva     tmp1, IO_DCB::daux1
        mwa     ptr1, IO_DCB::dbuflo
        jmp     _fn_io_do_bus
.endproc

.rodata
t_io_set_device_filename:
        .byte $e2, $80, $ff, $ff, $00, $01, $ff, $00
