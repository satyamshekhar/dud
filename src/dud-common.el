(require 'whitespace)

;; Use to C-q C-i insert horizontal tabs.
(setq-default indent-tabs-mode nil)

(delete-selection-mode t)
(setq x-select-enable-clipboard t)
(global-auto-revert-mode -1)

(global-whitespace-mode t)
(setq whitespace-style '(face trailing tabs lines-tail newline empty))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; (add-hook 'write-file-hooks 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'dud-cpp-mode)
(require 'dud-protobuf-mode)

(provide 'dud-common)
