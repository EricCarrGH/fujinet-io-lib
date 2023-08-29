        .export     _fn_io_create_new
        .export     t_disk_num_sectors, t_disk_sector_sizes, t_io_create_new

        .import     popa, popax, _strncpy, pushax
        .import     _fn_io_copy_cmd_data, _fn_io_do_bus

        .include    "zeropage.inc"
        .include    "fn_macros.inc"
        .include    "fn_io.inc"
        .include    "fn_data.inc"

; void fn_io_create_new(uint8_t selected_host_slot, uint8_t selected_device_slot, uint16_t selected_size, struct NewDisk *new_disk, char *dir_path)
.proc _fn_io_create_new
        axinto  ptr3            ; directory path src
        popax   ptr4            ; buffer for new disk, caller responsible for memory. IMPORTANT! ptr4 not trashed by _strncpy
        popax   ptr1            ; size (word) - one of 90, 130, ... etc. see below
        popa    tmp1            ; device_slot (byte)
        popa    tmp2            ; host_slot (byte)

        ; convert selected_size into DiskSize index
        cpw     ptr1, #90
        beq     s90
        cpw     ptr1, #130
        beq     s130
        cpw     ptr1, #180
        beq     s180
        cpw     ptr1, #360
        beq     s360
        cpw     ptr1, #720
        beq     s720
        cpw     ptr1, #1440
        beq     s1440

        ; TODO CUSTOM 999, for now just return as error
        rts

s90:    ldx     #DiskSize::size90
        .byte   $2c     ; BIT
s130:   ldx     #DiskSize::size130
        .byte   $2c     ; BIT
s180:   ldx     #DiskSize::size180
        .byte   $2c     ; BIT
s360:   ldx     #DiskSize::size360
        .byte   $2c     ; BIT
s720:   ldx     #DiskSize::size720
        .byte   $2c     ; BIT
s1440:  ldx     #DiskSize::size1440

        ; Y now holds index of numSectors/sectorSize values to read from tables below

        ; I have no doubt there's a better way to do this.
        ; Storing num_sectors L/H values into allocated memory structure
        ; we are using y as ptr offset, but have to keep swapping it between load and set

        ; ----------------------------------------------------------------------
        ; numSectors
        lda     t_disk_num_sectors, x
        ldy     #NewDisk::numSectors
        sta     (ptr4), y

        ; HIGH byte
        inx

        lda     t_disk_num_sectors, x
        ldy     #NewDisk::numSectors + 1
        sta     (ptr4), y

        dex     ; reset x to index

        ; ----------------------------------------------------------------------
        ; sectorSize
        lda     t_disk_sector_sizes, x
        ldy     #NewDisk::sectorSize
        sta     (ptr4), y

        ; HIGH byte
        inx

        lda     t_disk_sector_sizes, x
        ldy     #NewDisk::sectorSize + 1
        sta     (ptr4), y

        ; ----------------------------------------------------------------------
        ; deviceSlot
        lda     tmp1
        ldy     #NewDisk::deviceSlot
        sta     (ptr4), y

        ; ----------------------------------------------------------------------
        ; hostSlot
        lda     tmp2
        ldy     #NewDisk::hostSlot
        sta     (ptr4), y

        ; ----------------------------------------------------------------------
        ; filename - need location of this for strncpy
        ; ptr4 points to new disk buffer, we need to add offset to the filename
        adw     ptr4, #NewDisk::filename

        ; and copy the string there
        pushax  ptr4            ; dst
        pushax  ptr3            ; src
        setax   #$100           ; copy up to 256 bytes
        jsr     _strncpy        ; this leaves only ptr4 intact

        ; restore ptr4 to start of buffer
        sbw     ptr4, #NewDisk::filename
        mwa     ptr4, ptr3      ; copy memory location down to ptr3, as ptr4 is lost shortly

        ; finally setup DCB and call BUS
        setax   #t_io_create_new
        jsr     _fn_io_copy_cmd_data     ; trashes ptr4
        mwa     ptr3, IO_DCB::dbuflo
        mva     #$fe, IO_DCB::dtimlo
        jmp     _fn_io_do_bus
        ; implicit rts
.endproc

.rodata
t_disk_num_sectors:
        .word  720, 1040,  720, 1440, 2880, 5760
t_disk_sector_sizes:
        .word  128,  128,  256,  256,  256,  256

.define NDsz .sizeof(NewDisk)

t_io_create_new:
        .byte $e7, $80, $ff, $ff, <NDsz, >NDsz, $00, $00
