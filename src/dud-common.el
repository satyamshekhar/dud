(require 'whitespace)

;; Use to C-q C-i insert horizontal tabs.
(setq-default indent-tabs-mode nil)

(delete-selection-mode t)
(global-hl-line-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; (add-hook 'write-file-hooks 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'dud-common)
