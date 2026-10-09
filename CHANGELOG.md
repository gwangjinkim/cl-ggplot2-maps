# Changelog

All notable changes to this project are documented here. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/). See AGENTS.md
("Change Discipline") for how entries and commits are written.

## [Unreleased]

### Added
- Scaffold for milestone GG7M (topic: repository setup):
  - system `cl-ggplot2-maps` (GPL-2.0-only), depends on cl-ggplot2;
    package `CL-GGPLOT2-MAPS` with `*r-maps-version*` ("3.4.3"),
    `*databases*` (the nine R map databases) and `database-available-p`;
  - FiveAM tests (`cl-ggplot2-maps/tests`, 5 checks) whose test-op fails
    on failure; Makefile and scripts/test.ros as in the sibling repos;
  - `data-raw/`: uvr project pinned to R 4.6.1 and maps 3.4.3
    (`uvr add maps@==3.4.3`, `uvr.lock`) with `check-versions.R`, which
    verifies the versions and that all nine databases load in R;
  - `data/` for the converted databases (empty until GG7M).
