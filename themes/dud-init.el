;; Houses customizations required to load/setup themes.
;; Default theme: zenburn

(add-to-list 'custom-theme-load-path 
	     (file-name-as-directory (file-name-directory load-file-name)))
(load-theme 'zenburn t)
