        .import         pusha, _fn_io_unmount_host_slot
        .export         _main, t_slot
        .include        "fn_macros.inc"

.proc _main
        lda   t_slot

        jsr _fn_io_unmount_host_slot
        rts
.endproc

.bss
t_slot:   .res 1