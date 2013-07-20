;; Dud is emacs configuration for scaligent.
;;
;;     Copyright (C) 2013  Satyam Shekhar

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
  (message "Loading: %s" init-dir)
  (let ((file (expand-file-name "dud-init.el" init-dir)))
    (when (file-exists-p file)
      (load file))))

;; Saves all the UI customization to this file.
(setq custom-file (expand-file-name "custom.el" dud-personal-dir))
(load custom-file)

;; Set package management.
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
