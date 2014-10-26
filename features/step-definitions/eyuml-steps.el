;;; eyuml-steps.el --- Steps used with ecukes

;; Copyright (C) 2014 Anthony HAMON

;; Author: Anthony HAMON <hamon.anth@gmail.com>
;; URL: http://github.com/antham/eyuml

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

(Given "^I insert \"\\(.+\\)\" in buffer and save to \"\\(.+\\)\"$"
       "Add content to a buffer and save it"
       (lambda (data path)
         (insert data)
         (write-file path)))

(Given "^I insert \"\\(.+\\)\" in buffer$" "Add content to a buffer"
       (lambda (data)
         (insert data)))

(Then "^I should be in buffer matching regexp \"\\(.+\\)\"$" "Match REGEXP against buffer-name"
      (lambda (expected)
        (let ((message "Expected to be in buffer '%s', but was in '%s'"))
          (string-match expected (buffer-name)))))

(Then "^check file \"\\(.+\\)\" exists after \"\\([0-9]+\\)\" seconds$"
      (lambda (path seconds)
        (sleep-for (string-to-number seconds))
        (cl-assert (file-exists-p path) t "File doesn't exist")))

(Then "^md5 checksum of \"\\(.+\\)\" is \"\\([0-9a-f]+\\)\"$"
      (lambda (path checksum)
        (with-temp-buffer
          (insert-file-contents path)
          (cl-assert (equal (secure-hash 'md5 (current-buffer)) checksum) t (concat
                                                                             "File checksum doesn't match, current one is "
                                                                             (secure-hash 'md5
                                                                                          (current-buffer)))))))

(Then "^I execute the action chain and see \"\\(.+\\)\" error$"
      "Executes the action chain and catch error."
      (lambda (error-message)
        (condition-case err
            (execute-kbd-macro espuds-action-chain)
          (setq espuds-chain-active nil)
          (error
           (cl-assert (equal (error-message-string err) error-message) t (concat
                                                                          "Error message is : "
                                                                          (error-message-string
                                                                           err)))))))

(provide 'eyuml-steps)

;;; eyuml-steps.el ends here
