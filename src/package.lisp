;;;; src/package.lisp
;;;; Copyright (C) 2026 Gwang-Jin Kim. GPL-2.0-only; see LICENSE.

(defpackage #:cl-ggplot2-maps
  (:use #:cl)
  (:nicknames #:ggplot2-maps)
  (:export #:*r-maps-version*
           #:*databases*
           #:database-available-p))
