Feature: IO library test - fn_io_error

  This tests FN-IO fn_io_error

  Scenario Outline: execute fn_io_error for c64 always returns false
    Given c64-fn-io simple test setup
      And I add c64 src file "fn_io_error.c"
      And I create and load simple application

     When I execute the procedure at _fn_io_error for no more than 10 instructions
     Then I expect register A equal <A>
      And I expect register X equal <X>

    Examples:
      | unused |  A   |  X   |
      | 0x00   | 0x00 | 0x00 |
      | 0x80   | 0x00 | 0x00 |
