;; Scalimacs is emacs configuration for scaligent.
;;
;;     Copyright (C) 2013  Satyam Shekhar

(defvar scalimacs-root-dir (file-name-directory load-file-name)
  "Directory from where this file is loaded. The same director should
   house other init directories.")

(message "Initializing emacs, scalimacs-root-dir: %s." scalimacs-root-dir)

(defvar scalimacs-src-dir (expand-file-name "src" scalimacs-root-dir)
  "Directory where all scalimacs internal functions are stored.")
(defvar scalimacs-personal-dir (expand-file-name "personal" scalimacs-root-dir)
  "Directory where personal customizations should go.")
(defvar scalimacs-themes-dir (expand-file-name "themes" scalimacs-root-dir)
  "Directory where themes are stored. Do a M-x load theme <Enter> to
see a list of available options.")

;; List of top level directories for scalimacs.  These folders are added
;; to the load path and init.el from each of these directories is loaded.
(defvar init-directory-list (list scalimacs-src-dir
				  scalimacs-themes-dir
				  scalimacs-personal-dir)
  "List of directories used during initialization.")

(dolist (init-dir init-directory-list)
  (add-to-list 'load-path init-dir))

(dolist (init-dir init-directory-list)
  (load (expand-file-name "scalimacs-init.el" init-dir)))

;; Saves all the UI customization to this file.
(setq custom-file (expand-file-name "custom.el" scalimacs-personal-dir))
(load custom-file)

;; Set package management.
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
