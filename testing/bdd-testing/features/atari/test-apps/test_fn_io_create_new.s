        .export         _main, t_newdisk
        .import         pusha, _fn_io_create_new, pushax
        .include        "fn_macros.inc"

.proc _main
        setax   t_newdisk
        jsr _fn_io_create_new
        rts
.endproc

.bss
t_newdisk:      .res 2
