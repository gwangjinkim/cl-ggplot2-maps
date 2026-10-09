# cl-ggplot2-maps

Optional add-on for [cl-ggplot2](https://github.com/gwangjinkim/cl-ggplot2):
the map databases of R's **maps** package (version 3.4.3), so that
`map_data`, `borders`, `geom_map` and `coord_map` give exactly the same
results as in R.

```lisp
(ql:quickload :cl-ggplot2-maps)   ; after cl-ggplot2
;; planned API (milestone GG7M):
;; (map_data "world" :source :r-maps)
```

Without this add-on, cl-ggplot2 draws maps from Natural Earth (public
domain, current borders). With it, the R databases are available as well.

## Licence: GPL-2.0-only

This repository is licensed under the **GNU General Public License,
version 2 only** (see [LICENSE](LICENSE)), because its data is derived from
the R package maps, which is GPL-2. It is the **only GPL component** of the
Common Lisp tidyverse stack; all other cl-* packages are MIT.

- cl-ggplot2-maps depends on cl-ggplot2 (MIT). cl-ggplot2 and cl-tidyverse
  never depend on cl-ggplot2-maps, so loading the tidyverse does not pull in
  GPL code or data.
- If you distribute a program that includes cl-ggplot2-maps, the GPL-2
  terms apply to that combination.
- No code or data from this repository may be copied into the MIT
  packages.

## Data source and credits

The map databases come from the R package
[maps](https://CRAN.R-project.org/package=maps) 3.4.3 by Richard A. Becker
and Allan R. Wilks (original S code), Ray Brownrigg (R version), Thomas P.
Minka (enhancements) and Alex Deckmyn (maintainer). The world outlines
derive from the CIA World Data Bank II.

Databases: `world`, `world2` (Pacific-centred), `usa`, `state`, `county`,
`france`, `italy`, `nz`, `lakes`; plus city tables (`world.cities`,
`us.cities`, `canada.cities`) and code tables (FIPS, ISO 3166).

## Status

Scaffold (2026-10-09): the system loads and declares the databases. The
data conversion is milestone **GG7M** of the parity plan
(`docs/PARITY-PLAN.md` in cl-tidystat, private; ask the maintainer for
access). It runs after GG7 (Natural Earth maps in cl-ggplot2).

## Layout

| Path | What |
|---|---|
| `cl-ggplot2-maps.asd` | system (GPL-2.0-only), depends on cl-ggplot2 |
| `src/` | Lisp code |
| `data/` | converted map databases (`<name>.sexp`; produced in GG7M) |
| `data-raw/` | uvr project (R 4.6.1, maps 3.4.3) that will produce `data/` |
| `tests/` | FiveAM tests (`make test`) |

The R side uses only uvr:

```sh
cd data-raw
uvr sync                    # R 4.6.1 + maps 3.4.3 from uvr.lock
uvr run check-versions.R    # verifies versions and that all databases load
```
