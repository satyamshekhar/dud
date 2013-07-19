;; cc mode
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

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
