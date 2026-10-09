;;;; cl-ggplot2-maps.asd
;;;;
;;;; GPL-2.0-only. This is the only GPL component of the cl-* tidyverse
;;;; stack: it carries map data derived from the R package maps 3.4.3
;;;; (GPL-2). It depends on cl-ggplot2 (MIT); cl-ggplot2 and cl-tidyverse
;;;; never depend on it.

(asdf:defsystem #:cl-ggplot2-maps
  :description "Optional add-on for cl-ggplot2: the map databases of R's
maps package (world, usa, state, county, ...) for map_data and borders,
giving results identical to R."
  :author "Gwang-Jin Kim <gwang.jin.kim.phd@gmail.com>"
  :license "GPL-2.0-only"
  :version "0.0.1"
  :depends-on (#:cl-ggplot2)
  :serial t
  :components ((:module "src"
                :serial t
                :components ((:file "package")
                             (:file "databases"))))
  :in-order-to ((asdf:test-op (asdf:test-op #:cl-ggplot2-maps/tests))))

(asdf:defsystem #:cl-ggplot2-maps/tests
  :description "Tests for cl-ggplot2-maps."
  :author "Gwang-Jin Kim <gwang.jin.kim.phd@gmail.com>"
  :license "GPL-2.0-only"
  :depends-on (#:cl-ggplot2-maps #:fiveam)
  :components ((:module "tests"
                :components ((:file "main"))))
  :perform (asdf:test-op (op c)
             (declare (ignore op c))
             (unless (uiop:symbol-call :fiveam :run! :cl-ggplot2-maps)
               (error "cl-ggplot2-maps tests failed"))))
