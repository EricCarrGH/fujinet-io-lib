Feature: IO library test - fn_io_mount_disk_image

  This tests FN-IO fn_io_mount_disk_image

  Scenario: execute _fn_io_mount_disk_image
    Given fn-io application test setup
      And I add common io files
      And I add common src file "fn_io_mount_disk_image.s"
      And I add file for compiling "features/test-setup/test-apps/test_fn_io_mount_disk_image.s"
      And I add file for compiling "features/test-setup/stubs/bus-simple.s"
      And I create and load application
      And I write memory at $80 with $ff
      And I write memory at t_mode with $01
      And I write memory at t_slot with $05
     When I execute the procedure at _init for no more than 100 instructions

    # check the DCB values were set correctly
    Then I expect to see DDEVIC equal $70
     And I expect to see DUNIT equal $01
     And I expect to see DTIMLO equal $fe
     And I expect to see DCOMND equal $f8
     And I expect to see DSTATS equal $00
     And I expect to see DBYTLO equal $00
     And I expect to see DBYTHI equal $00
     And I expect to see DAUX1 equal $05
     And I expect to see DAUX2 equal $01
     And I expect to see DBUFLO equal $00
     And I expect to see DBUFHI equal $00

    # check BUS was called
    Then I expect to see $80 equal $01