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

(require 'js2-mode)

(defun dud-js-mode-hook ()
  "Customizations to c-mode"
  (setq whitespace-style '(face trailing tabs lines-tail newline empty))
  (setq whitespace-line-column 80)
  (whitespace-mode t)
  (font-lock-add-keywords
   nil
   '(("\\<\\(FIXME\\|TODO\\|BUG\\)" 1 font-lock-warning-face t))))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(provide 'dud-js-mode)
