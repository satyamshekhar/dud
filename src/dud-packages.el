;; Dud is emacs configuration for dummy's. It's meant to expose the
;; power of emacs without much configuration and at the same time
;; adhering to emacs philosophy of customization.
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

;; Packages with minor configurations live in this file. As and when
;; the configuration grows or gets complex we will move it out to a
;; separate config file.

(require 'smex)
(smex-initialize)

(require 'perspective)
(persp-mode)

; (require 'undo-tree)
(undo-tree-mode -1)
(global-undo-tree-mode -1)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-use-faces nil)
(setq ido-enable-flex-matching t)
(setq ido-enable-tramp-completion nil)
(setq ido-create-new-buffer 'always)
(ido-ubiquitous-mode t)

(autoload 'ace-jump-mode "ace-jump-mode"
  "Emacs quick move minor mode" t)
(autoload 'ace-jump-mode-pop-mark "ace-jump-mode"
  "Ace jump back:-)" t)
(eval-after-load "ace-jump-mode" '(ace-jump-mode-enable-mark-sync))

(require 'ack-and-a-half)
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(require 'flyspell)
(setq flyspell-issue-message-flag nil)
(setq ispell-list-command "--list")
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))

(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)
(define-key ac-mode-map [(meta return)] 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs/ac-dicts")

(require 'buffer-stack-suppl)

(require 'json-pretty-print)
(require 'thrift-mode)
(require 'dud-cpp-mode)
(require 'dud-protobuf-mode)
(require 'dud-js-mode)

(provide 'dud-packages)
