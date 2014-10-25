(require 'f)

(defvar eyuml-support-path
  (f-dirname load-file-name))

(defvar eyuml-features-path
  (f-parent eyuml-support-path))

(defvar eyuml-root-path
  (f-parent eyuml-features-path))

(add-to-list 'load-path eyuml-root-path)

(require 'eyuml)
(require 'espuds)
(require 'ert)

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )
