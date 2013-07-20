(defun dud-c-mode-hook ()
  "Customizations to c-mode"
  (setq whitespace-style '(face trailing tabs lines-tail newline empty))
  (setq whitespace-line-column 80)
  (whitespace-mode t))

(defvar dud-c-rotation-map '((".hpp" . (".cpp"))
                             (".cpp" . "_test.cpp")
                             ("_test.cpp" . (".hpp"))))

(defun dud-c-can-rotate ()
  "Returns true if the file can be rotated, false otherwise."
  ())

(defun dud-c-rotate ()
  "Rotates buffer among file.hpp <-> file.cpp <-> file_test.cpp"
  (interactive)
  (if (dud-c-can-rotate (buffer-file-name))
      ()
    (message "")))

;; local-set-key

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook 'dud-c-mode-hook)

(provide 'dud-cpp-mode)
