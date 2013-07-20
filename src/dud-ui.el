(setq inhibit-startup-screen 1)

(setq line-number-mode t)
(setq column-number-mode t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode 1)

(global-hl-line-mode t)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(provide 'dud-ui)
