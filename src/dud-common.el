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

(require 'whitespace)

;; Increase GC memory limit.
(setq gc-cons-threshold 20000000)

;; Use to C-q C-i insert horizontal tabs.
(setq-default indent-tabs-mode nil)

(delete-selection-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq x-select-enable-clipboard t)
(global-auto-revert-mode -1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-whitespace-mode t)
(setq whitespace-style '(face trailing tabs lines-tail newline empty))

(provide 'dud-common)
