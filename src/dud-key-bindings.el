(global-set-key (kbd "C-+")   'text-scale-increase)
(global-set-key (kbd "C--")   'text-scale-decrease)
(global-set-key (kbd "C-x t") 'eshell)
(global-set-key (kbd "<f12>") 'menu-bar-mode)

(global-set-key [f11] 'dud-toggle-fullscreen)

(global-set-key [S-up]    'windmove-up)
(global-set-key [S-down]  'windmove-down)
(global-set-key [S-left]  'windmove-left)
(global-set-key [S-right] 'windmove-right)

(provide 'dud-key-bindings)
