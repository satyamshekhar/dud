;;; package --- dud.el
;;; Commentary:
;; Dud is Emacs configuration for dummy's.  It's meant to expose the
;; power of Emacs without much configuration and at the same time
;; adhereing to Emacs philosophy of customization.
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

;; List of packages that dud sets up for you.  Comment out any packages
;; that you dislike/don't need.  Dud will not set that package up and
;; remove all the key-bindings that it uses.
;;; Code:
(defvar dud-install-packages
  '(ace-jump-mode        ;; Try with C-c SPC
    ace-window
    ack-and-a-half       ;; Better grep
    ;; impatient-mode
    ;; multiple-cursors  ;; Multiple cursors
    ;; rust-mode
    ;; bazel-mode        ;; Bazel mode for Bazel build files.
    ;; auto-complete     ;; auto-completions
    color-theme          ;; required for supported themes.
    company-mode         ;; for auto completions.
    company-flx          ;; Fuzzy matching for company.
    ;; eclim             ;; eclipse features into emacs.
    el-get               ;; package manager
    ;; emacs-jabber      ;; jabber support for emacs.
    ;; escreen           ;; screen for emacs, C-\ C-h
    ;; evil              ;; vim mode
    ;; evil-leader       ;; vim-leader mode
    ;; expand-region     ;; expand-region by region
    f
    flx                  ;; better suggestions for ido
    flycheck             ;; on the fly check for compilation errors.
    go-mode
    ;; g-client          ;; google client.
    ;; goto-last-change  ;; jump to last change.
    ;; helm              ;; navigator.
    ido-ubiquitous       ;; use ido everywhere.
    js2-mode             ;; better js mode.
    key-chord            ;; More option for key-bindings.
    kill-ring-rotate     ;; browse and rotate kill rings.
    nginx-mode           ;; Mode to edit nginx config.
    ;; magit             ;; git support.
    ;; rg                ;; Better grep / ack (INSTALL MANUALLY)
    smex                 ;; Better M-x
    space-chord          ;; Enable space binding for key-chord.
    vimish-fold          ;; Vim like folding.
    ;; tabbar            ;; a tab bar at the top.
    ;; undo-tree         ;; undo tree - disables re-doing with undo.
    yasnippet)        ;; snippets
  "List of packages to be enabled/setup by dud.
Commenting out any package that you don't need will disable it from dud.")

(defvar dud-themes '(color-theme-almost-monokai
                     color-theme-chocolate-rain
                     color-theme-desert
                     color-theme-ir-black
                     color-theme-tomorrow)
  "List of themes installed by dud.")
;; Themes have recipes defined for elget.
(dolist (dud-theme dud-themes)
  (add-to-list 'dud-install-packages dud-theme))

;; Nagios mode.

(defvar dud-root-dir (file-name-directory load-file-name)
  "Directory from where this file is loaded.
This file will initialize dud assuming the project structure is same on all
machines.")

(message "Initializing dud: %s." dud-root-dir)

(defvar dud-src-dir (expand-file-name "src" dud-root-dir)
  "Directory where all dud internal functions are stored.")
(defvar dud-personal-dir (expand-file-name "personal" dud-root-dir)
  "Directory where personal customizations should go.")
(defvar dud-themes-dir (expand-file-name "themes" dud-root-dir)
  "Directory where themes are stored.
Do a M-x load theme <Enter> to see a list of available options.")
(defvar dud-lib-dir (expand-file-name "lib" dud-root-dir)
  "Directory where needed libraries are stored.")
(defvar dud-modes-dir (expand-file-name "modes" dud-root-dir)
  "Directory where all modes customizations are stored.")

;; List of top level directories for dud.  These folders are added
;; to the load path and init.el from each of these directories is loaded.
;; Order here is important.
(defvar init-directory-list (list dud-lib-dir
                                  dud-modes-dir
                                  dud-themes-dir
                                  dud-src-dir
                                  dud-personal-dir)
  "List of directories used during initialization.")

(dolist (init-dir init-directory-list)
  (add-to-list 'load-path init-dir))

(add-to-list 'custom-theme-load-path dud-themes-dir)

(defun dud-init ()
 "Initializes dud."
 (dolist (init-dir init-directory-list)
   (let ((file (expand-file-name "dud-init.el" init-dir)))
     (when (file-exists-p file)
       (load file)))))

;; Saves all the UI customization to this file.
;; (setq custom-file (expand-file-name "custom.el" dud-personal-dir))
;; (load custom-file)

(provide 'dud)

;;; dud.el ends here
