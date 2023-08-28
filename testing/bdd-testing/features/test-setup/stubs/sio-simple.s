; stub SIOV
    .include    "fn_macros.inc"
    .include    "fn_data.inc"

    .segment "SIO"
    .org SIOV

stubbed_sio:
    mva #$01, $80
    rts
