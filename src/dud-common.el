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

;; Create emacs server sockets in dud directory. This directory is mounted
;; in devdocker and allows clients in host to connect to emacs running
;; inside devdocker.
;; (setq server-host "0.0.0.0")
;; (setq server-port "3333")
;; (setq server-use-tcp t)
;; (setq server-socket-dir (concat dud-root-dir "/sockets"))

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
;; (setq-default indent-tabs-mode nil)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("SConscript" . python-mode) auto-mode-alist))
;; (setq auto-mode-alist
;;       (cons '("WORKSPACE" . python-mode) auto-mode-alist))
;; (setq auto-mode-alist
;;       (cons '("BUILD" . python-mode) auto-mode-alist))
;; (setq auto-mode-alist
;;       (cons '("\\.bzl\\'" . python-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist
             (cons (rx (or "/BUILD" "/WORKSPACE" ".bazel" ".bzl" ".BUILD") eos)
                   #'bazel-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun dud-use-tabs ()
  (setq-default tab-width 2)
  (setq-default indent-tabs-mode 1))

(defun dud-cc-mode-hook ()
  (local-set-key (kbd "M-]") 'dud-c-rotate)
  (local-set-key (kbd "M-[") 'dud-c-rotate-rev)
  (local-set-key (kbd "M-=") 'clang-format-buffer))

(defun dud-proto-mode-hook ()
  (local-set-key (kbd "M-=") 'clang-format-buffer))

(defun dud-java-mode-hook()
  (local-set-key (kbd "M-=") 'clang-format-buffer))

(defun dud-sh-mode-hook()
  (setq sh-basic-offset 2)
  (setq sh-indentation 2))

(defun dud-js-mode-hook()
  (dud-use-tabs)
  (setq js-indent-level 2))

(defun dud-prog-mode-hook ()
  "Customizations to prog-mode"
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq whitespace-line-column 75)
  (setq whitespace-style '(face trailing lines-tail newline empty))
  ;; (setq whitespace-style '(face trailing newline empty))
  (whitespace-mode t)
	;; (fci-mode t)
  ;; (linum-mode 1)
  (subword-mode)
  (font-lock-add-keywords
   nil
   '(("\\<\\(FIXME\\|TODO\\|BUG\\|NOTE\\)" 1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'dud-prog-mode-hook)
(add-hook 'markdown-mode-hook 'dud-prog-mode-hook)
(add-hook 'protobuf-mode-hook 'dud-prog-mode-hook)
(add-hook 'yaml-mode-hook 'dud-prog-mode-hook)

;; Use tabs for C++, Java, Go and Json
(add-hook 'protobuf-mode-hook 'dud-proto-mode-hook)
(add-hook 'c++-mode-hook 'dud-cc-mode-hook)
(add-hook 'java-mode-hook 'dud-java-mode-hook)
(add-hook 'sh-mode-hook 'dud-sh-mode-hook)
(add-hook 'js-mode-hook 'dud-js-mode-hook)
(add-hook 'go-mode-hook 'dud-use-tabs)
;; (add-hook 'before-save-hook #'gofmt-before-save)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup markdown
(defun dud-markdown-html (buffer)
  (princ (with-current-buffer buffer
    (format "<!DOCTYPE html><html><title>Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
         (current-buffer)))
(impatient-mode)
;; M-o to open markdown
(defun dud-markdown-mode-hook ()
  (setq-default indent-tabs-mode nil)
  (impatient-mode)
	;; (fci-mode t)
  (imp-set-user-filter 'dud-markdown-html)
  (local-set-key (kbd "M-o") 'imp-visit-buffer))

(add-hook 'markdown-mode-hook 'dud-markdown-mode-hook)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup jsonnet and tsonnet.
(add-to-list 'auto-mode-alist '("\\.jsonnet\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.tsonnet\\'" . js-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup fill column indicator
(require 'fill-column-indicator)
(setq fci-rule-column 75)
(setq fci-rule-color "brown")
(setq fci-rule-use-dashes -1)
(setq fci-handle-truncate-lines nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'dud-common)
