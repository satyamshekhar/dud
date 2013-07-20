(setq inhibit-startup-screen 1)

(setq line-number-mode t)
(setq column-number-mode t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode 1)

(global-hl-line-mode t)
(global-linum-mode -1)
;; (winner-mode 1)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(provide 'dud-ui)
