;;;; tests/main.lisp
;;;; Copyright (C) 2026 Gwang-Jin Kim. GPL-2.0-only; see LICENSE.

(defpackage #:cl-ggplot2-maps/tests
  (:use #:cl #:fiveam #:cl-ggplot2-maps))

(in-package #:cl-ggplot2-maps/tests)

(def-suite :cl-ggplot2-maps :description "cl-ggplot2-maps tests.")
(in-suite :cl-ggplot2-maps)

(test system-loads-with-cl-ggplot2
  (is (find-package :cl-ggplot2))
  (is (equal "3.4.3" *r-maps-version*)))

(test databases-listed-but-not-yet-converted
  "Scaffold state: the nine R databases are declared; conversion is GG7M."
  (is (= 9 (length *databases*)))
  (is (not (database-available-p "world")))
  (is (not (database-available-p "no-such-map"))))
