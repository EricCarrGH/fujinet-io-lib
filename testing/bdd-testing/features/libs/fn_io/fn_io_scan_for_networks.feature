Feature: IO library test - fn_io_scan_for_networks

  This tests FN-IO fn_io_scan_for_networks

  Scenario Outline: execute _fn_io_scan_for_networks
    Given fn-io simple test setup
      And I add common io files
      And I add common src file "fn_io_scan_for_networks.s"
      And I add file for compiling "features/test-setup/stubs/bus-dbuflo1.s"
      And I create and load simple application
      And I write memory at $80 with $00

     When I set register A to $aa
      And I write memory at t_v with <networks>
      And I execute the procedure at _fn_io_scan_for_networks for no more than 85 instructions

    # check the DCB values were set correctly
    Then I expect to see DDEVIC equal $70
     And I expect to see DUNIT equal $01
     And I expect to see DTIMLO equal $0f
     And I expect to see DCOMND equal $fd
     And I expect to see DSTATS equal $40
     And I expect to see DBYTLO equal $04
     And I expect to see DBYTHI equal $00
     And I expect to see DAUX1 equal $00
     And I expect to see DAUX2 equal $00
     # using tmp1, which in cc65 is ZP address $92
     And I expect to see DBUFLO equal lo($92)
     And I expect to see DBUFHI equal hi($92)

     And I expect register A equal <networks>

    Examples:
    | networks |
    | 0        |
    | 1        |
    | 10       |