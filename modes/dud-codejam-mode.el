;; Dud is emacs configuration for dummy's. It's meant to expose the
;; power of emacs without much configuration and at the same time
;; adhereing to emacs philosophy of customization.
;;
;;     Copyright (C) 2016  Satyam Shekhar
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

;; file-name suffix is compared with first elements from the list
;; in the order specified here.

(require 'google-c-style)

(defun dud-codejam-runtest ()
  "RunsTest"
  (interactive)
  (let* ((file-path (buffer-file-name))
        (rotated-files (dud-c-rotated-files file-path)))
    (if rotated-files
        (progn
          (loop for file in rotated-files
                when (file-exists-p file) return (find-file file))
          (message "No file found for any rotation."))
      (message "No rotation defined for current file"))))


(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook 'dud-configure-flycheck)

(provide 'dud-codejam-mode)
