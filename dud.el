;; Dud is supposed to be minimalistic setting required to get emacs up and 
;; running with reasonable power. It is heavily inspired by prelude - 
;; emacs starter kit. The name of the project is chosen such because I intend
;; for this to not become overloaded with modules but be a minimilistic 
;; piece of software that exposes the power of emacs.
;;
;;     Copyright (C) 2013  Satyam Shekhar
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(defvar dud-root-dir (file-name-directory load-file-name)
  "Directory from where this file is loaded. The same director should
   house other init directories.")

(defvar dud-core-dir (file-name-directory load-file-name)
  "Directory where all dud internal functions are stored.")
(defvar dud-personal-dir (expand-file-name "personal" dud-root-dir)
  "Directory where personal customizations should go.")
(defvar dud-themes-dir (expand-file-name "themes" dud-root-dir)
  "Directory where themes are stored. Do a M-x load theme <Enter> to
see a list of available options.")

(message "Initializing emacs, dud-root-dir: %s." dud-root-dir)

;; List of top level directories for dud.  These folders are added
;; to the load path and init.el from each of these directories is loaded.
(defvar init-directory-list '(dud-themes-dir 
			      dud-personal-dir
			      )
  "List of directories used during initialization.")

()

;; Saves all the UI customization to this file.
(setq custom-file (expand-file-name "custom.el" personal-dir))
(load custom-file)

;; Set package management.
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))



