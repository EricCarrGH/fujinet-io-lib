# fujinet-io-lib

Build FujiNet IO cc65 libraries for supported targets.

## Header file

See [fn_io.h](src/common/inc/fn_io.h)

This contains the prototype definitions for all supported commands.

## Building

To build all target libraries, simply run `make`.

The default will run `clean all` against all target platforms:

```shell
make
```

For target specific only, add `TARGETS=foo`

```shell
make TARGETS=atari
```

## Version, Changelog and Releasing

The latest version of the library should be updated in [version.txt](/version.txt).
This follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

There is also a [Changelog](Changelog.md) that should be updated listing the changes.
More documentation can be found in that file.

A `dist` task will create a zip file of the library, and the Changelog.

```shell
make TARGETS=atari clean dist
```

Contents can be checked with:

```shell
$ unzip -t dist/fn_io_atari_1.0.0.zip 
Archive:  dist/fn_io_atari_1.0.0.zip
    testing: Changelog.md             OK
    testing: fn_io_1.0.0.lib          OK
```

## Target specific code

Specific code should be implemented in `src/<target>` folder.

## Testing

Testing is done with BDD features. See [Testing README](testing/bdd-testing/README.md)
