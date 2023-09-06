        .export         _fn_io_get_adapter_config
        .export         t_io_get_adapter_config
        .import         _fn_io_copy_cmd_data, _fn_io_do_bus

        .include        "zeropage.inc"
        .include        "fn_macros.inc"
        .include        "fn_data.inc"
        .include        "fn_io.inc"

; void fn_io_get_adapter_config(void *adapter_config)
;
.proc _fn_io_get_adapter_config
        ; store the memory location of the adapter config
        axinto  ptr1            ; adapter config location

        setax   #t_io_get_adapter_config
        jsr     _fn_io_copy_cmd_data

        ; set the memory address for DCB to write to and call BUS
        mwa     ptr1, IO_DCB::dbuflo
        jmp     _fn_io_do_bus

.endproc

.rodata
.define ACsz .sizeof(AdapterConfig)

t_io_get_adapter_config:
        .byte $e8, $40, $ff, $ff, <ACsz, >ACsz, $00, $00
