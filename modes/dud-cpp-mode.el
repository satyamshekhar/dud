;; Dud is a very simple emacs configuration project meant to make
;; configuration very simple and thus the name.
;;
;;     Copyright (C) 2013  Satyam Shekhar
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
;; 02110-1301, USA.

(defun dud-c-mode-hook ()
  "Customizations to c-mode"
  (setq whitespace-style '(face trailing tabs lines-tail newline empty))
  (setq whitespace-line-column 80)
  (whitespace-mode t))

(defvar dud-c-rotation-map '((".hpp" . (".cpp"))
                             (".cpp" . "_test.cpp")
                             ("_test.cpp" . (".hpp"))))

(defun dud-c-can-rotate ()
  "Returns true if the file can be rotated, false otherwise."
  ())

(defun dud-c-rotate ()
  "Rotates buffer among file.hpp <-> file.cpp <-> file_test.cpp"
  (interactive)
  (if (dud-c-can-rotate (buffer-file-name))
      ()
    (message "")))

;; local-set-key

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook 'dud-c-mode-hook)

(provide 'dud-cpp-mode)
