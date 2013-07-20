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

(defvar dud-root-dir (file-name-directory load-file-name)
  "Directory from where this file is loaded. The same director should
   house other init directories.")

(message "Initializing dud: %s." dud-root-dir)

(defvar dud-src-dir (expand-file-name "src" dud-root-dir)
  "Directory where all dud internal functions are stored.")
(defvar dud-personal-dir (expand-file-name "personal" dud-root-dir)
  "Directory where personal customizations should go.")
(defvar dud-themes-dir (expand-file-name "themes" dud-root-dir)
  "Directory where themes are stored. Do a M-x load theme <Enter> to
see a list of available options.")
(defvar dud-lib-dir (expand-file-name "lib" dud-root-dir)
  "Directory where needed libraries are stored.")
(defvar dud-modes-dir (expand-file-name "modes" dud-root-dir)
  "Directory where all modes customizations are stored.")

;; List of top level directories for dud.  These folders are added
;; to the load path and init.el from each of these directories is loaded.
(defvar init-directory-list (list dud-src-dir
                                  dud-themes-dir
                                  dud-personal-dir
                                  dud-lib-dir
                                  dud-modes-dir)
  "List of directories used during initialization.")

(dolist (init-dir init-directory-list)
  (add-to-list 'load-path init-dir))

(dolist (init-dir init-directory-list)
  (let ((file (expand-file-name "dud-init.el" init-dir)))
    (when (file-exists-p file)
      (load file))))

;; Saves all the UI customization to this file.
(setq custom-file (expand-file-name "custom.el" dud-personal-dir))
(load custom-file)
