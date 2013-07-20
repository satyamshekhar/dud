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

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-)") (lambda ()
                              (interactive)
                              (text-scale-set 0)))

(global-set-key (kbd "C-x t") 'eshell)
(global-set-key (kbd "<f12>") 'menu-bar-mode)

(global-set-key [f11] 'dud-toggle-fullscreen)

(global-set-key [S-up]    'windmove-up)
(global-set-key [S-down]  'windmove-down)
(global-set-key [S-left]  'windmove-left)
(global-set-key [S-right] 'windmove-right)

(provide 'dud-key-bindings)
