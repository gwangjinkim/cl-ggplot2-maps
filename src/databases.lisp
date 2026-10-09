;;;; src/databases.lisp
;;;; Copyright (C) 2026 Gwang-Jin Kim. GPL-2.0-only; see LICENSE.

(in-package #:cl-ggplot2-maps)

;;; The databases are converted from the R package maps by
;;; data-raw/convert.R (milestone GG7M, not yet written) into data/.
;;; Until then the list documents what this system will provide.

(defparameter *r-maps-version* "3.4.3"
  "Version of the R package maps the data is derived from.")

(defparameter *databases*
  '("world" "world2" "usa" "state" "county" "france" "italy" "nz" "lakes")
  "Map databases of R's maps package that this system provides, by the
names R's maps::map() and ggplot2::map_data() use.")

(defun database-available-p (name)
  "True if the converted data for map database NAME is present in data/."
  (and (member name *databases* :test #'string=)
       (probe-file (asdf:system-relative-pathname
                    :cl-ggplot2-maps (format nil "data/~a.sexp" name)))
       t))
