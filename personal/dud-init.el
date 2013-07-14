;; Houses all the global customizations.
;; Make this dud.el.

;; Shortcuts:
;;  S-left - M


;; Don't display initialy splash screen.
(setq inhibit-startup-screen 1)

;; Set package repositories.
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Set save directory for backup (~) files. Use backup-by-
;; copying. Slowest and safest method.
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;; Display line, column number for each buffer.
(setq line-number-mode t)
(setq column-number-mode t)

;; Fix movement across multiple window.
(global-set-key [S-left] 'windmove-left)
(global-set-key [S-right] 'windmove-right)
(global-set-key [S-up] 'windmove-up)
(global-set-key [S-down] 'windmove-down)
