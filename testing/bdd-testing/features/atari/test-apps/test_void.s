        .export         _main
        .export         t_fn

        .import         pushax

        .include        "fn_macros.inc"

; tests a function with signature:
;    void function()
.proc _main
        jmp     @run

@run:   jmp     (t_fn)

.endproc

.bss
t_fn:   .res 2
