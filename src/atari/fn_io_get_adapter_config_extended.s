        .export         _fn_io_get_adapter_config_extended
        .import         _fn_io_copy_cmd_data, _fn_io_do_bus
        .import         t_io_get_adapter_config

        .include        "zeropage.inc"
        .include        "fn_macros.inc"
        .include        "fn_data.inc"
        .include        "fn_io.inc"

; void fn_io_get_adapter_config_extended(AdapterConfigExtended *adapter_config)
;
.proc _fn_io_get_adapter_config_extended
        ; store the memory location of the adapter config
        axinto  ptr1

        setax   #t_io_get_adapter_config
        jsr     _fn_io_copy_cmd_data

        ; set the memory address, new size, and aux1 for DCB
        mwa     ptr1, IO_DCB::dbuflo
        mwa     #.sizeof(AdapterConfigExtended), IO_DCB::dbytlo
        mva     #$01, IO_DCB::daux1
        jmp     _fn_io_do_bus

.endproc
