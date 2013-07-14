;; Houses customizations required to load/setup themes.

;; Change the load-theme variable to set the default theme (noctilux)).

;; Adds current directory name to custom theme load path.
(add-to-list 'custom-theme-load-path (file-name-directory load-file-name))
;; Sets up noctilux as the default them.
(load-theme 'noctilux t)

