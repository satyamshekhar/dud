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

(setq debug-on-error t)
;; Already enabled by default now. Keeping it here for consistency.
(setq transient-mark-mode t)
(global-font-lock-mode t)
(put 'overwrite-mode 'disabled t)
(setq x-select-enable-clipboard t)
(setq-default indent-tabs-mode nil)
(setq frame-title-format "%b - emacs")

;; Increase GC memory limit.
(setq gc-cons-threshold 500000000)

;; Use to C-q C-i insert horizontal tabs.
(setq-default indent-tabs-mode nil)

(delete-selection-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

;; Disable auto scroll due to jerky behavior with small font.
(setq auto-window-vscroll nil)

(global-auto-revert-mode -1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-by-copying-when-linked t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("SConscript" . python-mode) auto-mode-alist))

(defun dud-prog-mode-hook ()
  "Customizations to prog-mode"
  (setq whitespace-style '(face trailing tabs lines-tail newline empty))
  (setq whitespace-line-column 80)
  (whitespace-mode t)
  (linum-mode 1)
  (subword-mode)
  (font-lock-add-keywords
   nil
   '(("\\<\\(FIXME\\|TODO\\|BUG\\)" 1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'dud-prog-mode-hook)
(add-hook 'protobuf-mode-hook 'dud-prog-mode-hook)

(provide 'dud-common)
