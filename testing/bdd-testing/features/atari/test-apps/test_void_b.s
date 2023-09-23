        .export         _main
        .export         t_b1, t_fn

        .import         pushax

        .include        "fn_macros.inc"

; tests a function with signature:
;    void function(byte b1)
.proc _main
        lda     t_b1
        jmp     @run

@run:   jmp     (t_fn)

.endproc

.bss
t_b1:   .res 1

t_fn:   .res 2
