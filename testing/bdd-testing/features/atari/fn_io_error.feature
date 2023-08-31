Feature: IO library test - fn_io_error

  This tests FN-IO fn_io_error

  Scenario Outline: execute fn_io_error should return appropriate values depending on DSTATS
    Given atari-fn-io simple test setup
      And I add atari src file "fn_io_error.s"
      And I create and load simple application

     When I write memory at DSTATS with <init>
      And I execute the procedure at _fn_io_error for no more than 10 instructions
     Then I expect register A equal <A>

    Examples:
      | init |  A   |  X   |
      | 0x00 | 0x00 | 0x00 |
      | 0x01 | 0x00 | 0x00 |
      | 0x7f | 0x00 | 0x00 |
      | 0x80 | 0x01 | 0x00 |
      | 0x81 | 0x01 | 0x00 |
      | 0xff | 0x01 | 0x00 |