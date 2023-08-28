# fujinet-io-lib

Build FujiNet IO cc65 libraries for supported targets.

## Header file

See [fn_io.h](src/common/inc/fn_io.h)

This contains the prototype definitions for all supported commands.

## Building

To build all target libraries, simply run `make`.

The default will run `clean all` against all target platforms:

```shell
$ make
```

For target specific only, add `TARGETS=foo`

```shell
$ make TARGETS=atari
```

## Target specific code

Specific code should be implemented in `src/<target>` folder.

## Testing

Testing is done with BDD features. See [Testing README](testing/bdd-testing/README.md)
