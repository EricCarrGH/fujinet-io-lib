; C64 SPECIFIC VALUES
;
; This file must be replicated for each device

; The location where IO_DCB exists on C64.
; This structure is used to set the location of parameters that eventually get sent to FN device.
; I assume all devices have similar.
.struct IO_DCB
    .org $0300
    ddevic  .byte
    dunit   .byte
    dcomnd  .byte
    dstats  .byte
    dbuflo  .byte
    dbufhi  .byte
    dtimlo  .byte
    dunuse  .byte
    dbytlo  .byte
    dbythi  .byte
    daux1   .byte
    daux2   .byte
.endstruct
