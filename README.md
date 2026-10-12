# mainframer
Suite of tools in python for gnucobol, gcobol development


## MVP Goals

- install runtimes. 
  - Scripts that download and install.
- install packages
  - Possibly via a `git clone` pattern
  - Possibly via a self hosted server


## Stretch Goals
- install virtual environments
  - Scripts that create an isolated place with nothing shared
  - Or just copy Go and Npm and just make lots of copies
- compile
  - via opinionated patterns
- build tool integration
  - unit tests
  - doc string
  - linting
  - etc

## Project Links

- [GitHub](https://github.com/matthewdeanmartin/mainframer)
- [PyPI](https://pypi.org/project/mainframer/)
- [Bug Tracker](https://github.com/matthewdeanmartin/mainframer/issues)


## Python 3.15 verification (2026-10-04)

The earlier HTTPX bound is superseded by the HTTPX2 verification below.

Stable locks were refreshed with `uv lock --upgrade`. Dependency verification uses fresh environments and published wheels only; no source builds. Full developer tools still have wheel blockers (linkcheckmd or PyYAML); passing unit tests do not certify the full developer group. Evidence and details: `C:/github/python315_batch5_2026-10-04.md`. Human operators review and file any upstream bugs.


## HTTPX2 verification (2026-10-04)

Direct download requests now use HTTPX2. All 16 tests pass on RC3 stable/pre and 3.14.7; installed-wheel import and CLI help pass. This supersedes the earlier HTTPX <1 workaround. OS trust-store HTTPS verification and HTTPX2 exception/response types apply.

Dependency installs require published wheels; no native builds or GitHub jobs. Experimental mode allows prereleases but the successful HTTPX2 test environments selected stable packages. Locks were upgraded with `uv lock --upgrade`. Changes are local; human operators decide publishing and upstream reports.
