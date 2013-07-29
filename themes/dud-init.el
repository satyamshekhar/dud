;; Houses customizations required to load/setup themes.
;; Default theme: color-theme-ir-black. (defined in personal).

;; Supported themes:
(defvar dud-themes '(color-theme-almost-monokai
                     color-theme-chocolate-rain
                     color-theme-desert
                     color-theme-ir-black
                     color-theme-tomorrow))

;; Themes have recipes defined for elget.
(dolist (dud-theme dud-themes)
  (add-to-list 'dud-install-packages dud-theme))

(add-to-list 'custom-theme-load-path
             (file-name-as-directory (file-name-directory load-file-name)))
