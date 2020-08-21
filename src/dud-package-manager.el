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

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))

(defvar dud-package-dir (expand-file-name "packages" dud-root-dir))
(setq package-user-dir dud-package-dir)

;; Initialize package to put installed packages into load-path.
(package-initialize)

;; Path where packages are installed.
(setq el-get-dir dud-package-dir)
;; Path for the el-get package.
(setq el-get-install-dir (expand-file-name "el-get" el-get-dir))
;; This directory stores a local list of ELPA recipes.
(setq el-get-recipe-path-elpa
      (expand-file-name "recipes/elpa" el-get-install-dir))
(setq el-get-recipe-path-emacswiki
      (expand-file-name "recipes/emacswiki" el-get-install-dir))

(add-to-list 'load-path el-get-dir)
(add-to-list 'load-path el-get-install-dir)

(url-retrieve
 "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el"
 (lambda (s)
   (goto-char (point-max))
   (eval-print-last-sexp)))

(require 'el-get)
(setq el-get-notify-type 'message)

(el-get 'sync dud-install-packages)

(provide 'dud-package-manager)
