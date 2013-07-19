;; Use to C-q C-i insert horizontal tabs.
(setq-default indent-tabs-mode nil)

(require 'whitespace)

(delete-selection-mode t)
(global-hl-line-mode t)

;; (add-hook 'write-file-hooks 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'dud-common)
