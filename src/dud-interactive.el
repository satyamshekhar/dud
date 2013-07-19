(defun dud-toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(defun dud-rename-buffer-file ()
  "Renames current buffer and file"
  (interactive)
  ())

(defun dud-previous-edit-location ()
  "Goes to previous edit location"
  (interactive)
  ())

(provide 'dud-interactive)
