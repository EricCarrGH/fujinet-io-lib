# NOTES

## Generating stub C functions from H prototypes

Given commented out prototypes in the `fn_io.h` file, like:

```cpp
// uint8_t fn_io_hash_input(char *s, uint16_t len);
```

I created the stub c function for this with the script:

```shell
grep '^//' src/common/inc/fn_io.h | egrep '\(' | cut -d" " -f2- | cut -d\; -f1 | while read l; do FNAME=$(echo $l | cut -d" " -f2| cut -d\( -f1); echo $l | awk '{printf("#include <stdint.h>\n#include \"fn_io.h\"\n\n%s\n{\n", $0); if ($1 == "void") { printf("\n}\n"); } else { printf("    return 0;\n}\n"); }}' > src/c64/${FNAME}.c; done
```

Repeated for apple2.

Following for atari:

```shell
grep '^//' src/common/inc/fn_io.h | egrep '\(' | cut -d\( -f1 | cut -d" " -f3 | while read l; do echo $l | awk '{printf("        .export         _%s\n\n        .import         fn_io_copy_cmd_data\n        .import         _fn_io_do_bus\n        .import         popa, popax\n\n        .include        \"fn_zp.inc\"\n        .include        \"fn_macros.inc\"\n        .include        \"fn_data.inc\"\n\n.proc _%s\n        ; read args\n        ; set base data\n        setax   #t_%s\n        jsr    fn_io_copy_cmd_data\n        ; add extra IO_DCB::daux1 etc\n        jsr     _fn_io_do_bus\n\n        jmp     _fn_io_error\n.endproc\n\n.rodata\nt_%s:\n        .byte \n", $1, $1, $1, $1)}' > src/atari/${l}.s; done
```
