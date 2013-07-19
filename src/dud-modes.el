(require 'whitespace)

;; cc mode
(defun dud-c-mode-hook ()
  "Customizations to c-mode"
  (setq whitespace-style '(face trailing tabs lines-tail newline empty))
  (setq whitespace-line-column 80)
  (whitespace-mode t))

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook 'dud-c-mode-hook)

;; protobuf-mode
(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))
(defconst my-protobuf-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil)))
(add-hook 'protobuf-mode-hook
    (lambda () (c-add-style "my-style" my-protobuf-style t)))

;; python mode

;; js2-mode

(provide 'dud-modes)
