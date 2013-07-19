;; Set package repositories.
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Set save directory for backup (~) files. Use backup-by-
;; copying. Slowest and safest method.
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

(require 'scalemacs)
