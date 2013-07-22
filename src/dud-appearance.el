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

(setq inhibit-startup-screen 1)

(setq line-number-mode t)
(setq column-number-mode t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode 1)

(global-hl-line-mode t)
(global-linum-mode 1)
;; (winner-mode 1)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(provide 'dud-appearance)
