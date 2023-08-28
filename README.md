# fujinet-io-lib

Build cc65 libraries for supported targets.

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

The common source is in [src/common](src/common/) which holds the device agnostic code.

Specific code should be implemented in `src/<target>` folder.

### fn_data.inc

This file holds device specific definitions, most notably the definition of the location of DDEVIC.

## Testing

Testing is done with BDD features. See [Testing README](testing/bdd-testing/README.md)
