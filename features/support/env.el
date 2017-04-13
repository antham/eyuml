;;; env.el --- Environment use with ecukes

;; Copyright (C) 2014 Anthony HAMON

;; Author: Anthony HAMON <hamon.anth@gmail.com>
;; URL: http://github.com/antham/helm-backup

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'f)

(defvar eyuml-support-path (f-dirname load-file-name))

(defvar eyuml-features-path (f-parent eyuml-support-path))

(defvar eyuml-root-path (f-parent eyuml-features-path))

(add-to-list 'load-path eyuml-root-path)

(require 'eyuml)
(require 'espuds)
(require 'ert)

(defun clean ()
  "Clean test environment."
  (condition-case nil
      (delete-file "/tmp/schema")
    (delete-file "/tmp/schema.png")
    (error
     nil)))

(Setup
 ;; Before anything has run
 )

(Before (clean))

(After (clean))

(Teardown
 ;; After when everything has been run
 )

;;; env.el ends here
