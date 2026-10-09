# Agents guide — cl-ggplot2-maps

Read README.md first. This repository is **GPL-2.0-only** and the only GPL
component of the cl-* stack.

## Licensing rules (strict)

- Never copy code or data from this repository into an MIT repository
  (cl-ggplot2, cl-tidyverse, ...). Never make an MIT system depend on
  `cl-ggplot2-maps`.
- Every source file carries the header
  `Copyright (C) <year> Gwang-Jin Kim. GPL-2.0-only; see LICENSE.`
- Keep the credits for the R maps authors in README.md accurate.

## R environment

`data-raw/` is a uvr project (R 4.6.1, maps 3.4.3). Use only `uvr sync`,
`uvr run`, `uvr add`, `uvr r`. Never `install.packages()`, `pak`, or the
system R.

## Parity work

Milestone owned by this repository: **GG7M** (wave E, depends on GG7 in
cl-ggplot2). Plan and backlog: `docs/PARITY-PLAN.md` and
`parity/backlog/GG7M.md` in `../cl-tidystat` (private; ask the
maintainer). Work on `feat/parity-GG7M`.

## Change Discipline (git + documentation)

Every change to this repository must be reconstructible later: what changed,
why, and what it means for users. Agents and humans follow these rules.

1. **Branch, never commit straight to `main`.** Use a topic branch such as
   `fix/<topic>` or `feat/<topic>` (cross-package work in the tidystat effort
   uses `fix/tidystat-phase0`, `feat/tidystat-phase1`, ...).
2. **One logical change per commit.** Test-suite repairs, bug fixes, new
   features and documentation go in separate commits, so each can be
   reviewed, bisected or reverted on its own.
3. **Commit messages explain the why.** Format:
   ```
   <area>: <imperative summary, <= 72 chars>

   Problem:  what was wrong / missing, with the observable symptom.
   Cause:    the root cause (file:function), if it is a fix.
   Change:   what this commit does.
   Impact:   behaviour change for users; mark BREAKING if any.
   Tests:    which tests were added/changed, and the suite result.
   ```
4. **Every commit updates `CHANGELOG.md`** under `## [Unreleased]`, in the
   sections *Fixed*, *Added*, *Changed*, *Breaking*, *Tests*. Each entry
   says what users will notice and names the commit topic.
5. **Run the full test suite before committing** (`make test`, or from the
   umbrella repo `../cl-tidystat/scripts/run-tests.sh <this-package>`) and put
   the result in the commit message. Never commit with a red suite unless
   the commit message says so and why.
6. **Cross-package changes** (e.g. an API in `cl-vctrs-lite` used by
   `cl-dplyr`) are recorded in both repos' changelogs and in
   `../cl-tidystat/docs/CHANGES-phase*.md`, which links the commits.
7. **Push only after review**; do not rewrite history that has been pushed.
