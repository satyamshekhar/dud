;; Dud is emacs configuration for dummy's. It's meant to expose the
;; power of emacs without much configuration and at the same time
;; adhereing to emacs philosophy of customization.
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

;; Customizations to default c mode.
;; Dependencies: Requires google-c-style in your load-path. If you are
;; using this as a part of dud then it will take care of it. Otherwise
;; you can get it from here:
;;   http://google-styleguide.googlecode.com/svn/trunk/google-c-style.el

;; Besides setting up google-c-style mode it provides convenience functions
;; that you can use to rotate betweeh header, implementation and cpp files.

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
