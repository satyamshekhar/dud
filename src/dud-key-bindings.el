;; Dud is a very simple Emacs configuration project meant to make
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

(when window-system
   (global-unset-key (kbd "C-z")))
(global-unset-key (kbd "C-x C-c"))

;; Use key chord mode.
(require 'key-chord)
(key-chord-mode 1)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-)") (lambda ()
                              (interactive)
                              (text-scale-set 0)))
(global-set-key (kbd "C-;") 'dud-current-line-to-top)

(global-set-key [f9] 'dud-shell-command-bg)
(global-set-key [f11] 'dud-toggle-fullscreen)
(global-set-key [f12] 'menu-bar-mode)

(global-set-key (kbd "C-x t") 'eshell)

;; M-left/right - prev buffer, next buffer
;; M-up/down - move line up/down
;; ctrl-y - ctrl-y - should revolve through kill ring, ctrl-s-y kill ring
;; ctrl-z - undo, ctrl-shift-z - redo, meta-z - undo tree
;; meta-j - ace jump to char, meta-z - ace zap(cut) to char, meta-p copy to char
;; [f5] - reload file ctrl-x ctrl-v
;; [cx cc] - compile
;; [cc cp] - prev error, [cc cn] - nex error
;; diff two files in open buffer like vim diff.
;; zoo keeper traversal from emacs.

(global-set-key [S-up]    'windmove-up)
(global-set-key [S-down]  'windmove-down)
(global-set-key [S-left]  'windmove-left)
(global-set-key [S-right] 'windmove-right)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; (global-set-key (kbd "C-x C-z") 'magit-status)
;; (global-set-key (kbd "C-x C-/") 'goto-last-change)
;; (space-chord-define-global "f" 'find-file)
;; (key-chord-define-global ",," 'indent-for-comment)
;; (key-chord-define c++-mode-map ";;" "\C-e;")
;; (space-chord-define c-mode-map "c" 'compile)
;; (global-set-key (kbd "C-?") 'undo-tree-visualize)

(global-set-key "\M-z" 'fastnav-zap-up-to-char-forward)
(global-set-key "\M-Z" 'fastnav-zap-up-to-char-backward)
(global-set-key "\M-s" 'fastnav-jump-to-char-forward)
(global-set-key "\M-S" 'fastnav-jump-to-char-backward)
(global-set-key "\M-r" 'fastnav-replace-char-forward)
(global-set-key "\M-R" 'fastnav-replace-char-backward)
(global-set-key "\M-i" 'fastnav-insert-at-char-forward)
(global-set-key "\M-I" 'fastnav-insert-at-char-backward)
(global-set-key "\M-j" 'fastnav-execute-at-char-forward)
(global-set-key "\M-J" 'fastnav-execute-at-char-backward)
(global-set-key "\M-k" 'fastnav-delete-char-forward)
(global-set-key "\M-K" 'fastnav-delete-char-backward)
(global-set-key "\M-m" 'fastnav-mark-to-char-forward)
(global-set-key "\M-M" 'fastnav-mark-to-char-backward)
(global-set-key "\M-p" 'fastnav-sprint-forward)
(global-set-key "\M-P" 'fastnav-sprint-backward)

(global-set-key (kbd "<f8>") 'flyspell-check-next-highlighted-word)
(global-set-key (kbd "S-<f8>") 'flyspell-check-previous-highlighted-word)
(global-set-key (kbd "C-<f8>") 'flyspell-word)
(global-set-key (kbd "M-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-S-<f8>") 'flyspell-buffer)

(provide 'dud-key-bindings)
