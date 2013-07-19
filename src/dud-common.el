;; Use to C-q C-i insert horizontal tabs.
(setq-default indent-tabs-mode nil)

(require 'whitespace)

;; Enable deletion of selected text.
(delete-selection-mode t)

;; (add-hook 'write-file-hooks 'delete-trailing-whitespace)

(provide 'dud-common)
