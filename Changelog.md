# Changelog

## [Unreleased]

## [1.1.2] - 2023-10-15

### Changed

- Removed BDD6502 classes and use shared version, updated tests for new names
- Updated Features.md for new supported feature functions

### Fixed

- Fix fn_io_enable_udpstream dcomnd

## [1.1.1] - 2023-09-23

### Added

- Add return types to appkey functions

### Fixed

- Fix dstat in fn_io_appkey_open

## [1.1.0] - 2023-09-23

- All missing io functions supported by fujinet
- Stub functions for apple2 and c64 for missing functions
- Add fn_io.inc to zip archive, required for asm users
- Refactored features that used stub functions to standard set of callers

Complete list of new functions:

- void fn_io_enable_udpstream(uint16_t port, char *host);
- uint16_t fn_io_get_directory_position();
- void fn_io_get_host_prefix(uint8_t hs, char *prefix);
- uint8_t fn_io_get_hsio_index();
- void fn_io_set_sio_external_clock(uint16_t rate);
- void fn_io_set_hsio_index(bool save, uint8_t index);
- void fn_io_set_host_prefix(uint8_t hs, char *prefix);
- void fn_io_status(FNStatus *status);
- uint8_t fn_io_appkey_open(AppKeyOpen *buffer);
- uint8_t fn_io_appkey_read(AppKeyRead *buffer);
- uint8_t fn_io_appkey_write(uint16_t count, AppKeyWrite *buffer);
- uint8_t fn_io_base64_decode_compute();
- uint8_t fn_io_base64_decode_input(char *s, uint16_t len);
- uint8_t fn_io_base64_decode_length(unsigned long *len);
- uint8_t fn_io_base64_decode_output(char *s, uint16_t len);
- uint8_t fn_io_base64_encode_compute();
- uint8_t fn_io_base64_encode_input(char *s, uint16_t len);
- uint8_t fn_io_base64_encode_length(unsigned long *len);
- uint8_t fn_io_base64_encode_output(char *s, uint16_t len);
- uint8_t fn_io_hash_compute(uint8_t type);
- uint8_t fn_io_hash_input(char *s, uint16_t len);
- uint8_t fn_io_hash_length(uint8_t mode);
- uint8_t fn_io_hash_output(uint8_t output_type, char *s, uint16_t len);

## [1.0.0] - 2023-09-22

### Added

- This changelog to instil a process of clean version documentation for the library.
- fn_io_unmount_host_lost required by Lobby.
- `dist` task in Makefile to create versioned zip for library in dist/ folder.
- version.txt using semantic versioning (see Notes below).

### Changed

- Minor name changes to parameters in fn_io.h for consistency across all function definitions.
- default tasks for all targets includes `dist` to create a zip release

## Notes

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Use Added, Removed, Changed in triple headings.

Keep entries to lists and simple statements.
