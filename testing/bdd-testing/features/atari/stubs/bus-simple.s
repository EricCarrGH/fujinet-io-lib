; stub BUS
    .include    "fn_macros.inc"
    .include    "fn_data.inc"

    .segment "BUS"
    .org BUS

stubbed_bus:
    mva #$01, $80
    rts
