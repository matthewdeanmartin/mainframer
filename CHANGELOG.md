# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Python 3.15 support.

### Changed

- Requires Python 3.11 or newer; Python 3.8-3.10 are no longer supported.
- Replace direct HTTPX clients with HTTPX2; current releases use the OS trust store.

## [0.2.0] - 2024-12-27

### Added
- GnuCOBOL environment activation, build, and package installation support
- CLI entry point for managing COBOL environments and dependencies
- Configuration management and environment listing commands

## [0.1.0] - 2024-12-27

### Added

- Initial release

[0.2.0]: https://github.com/matthewdeanmartin/mainframer/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/matthewdeanmartin/mainframer/releases/tag/v0.1.0
