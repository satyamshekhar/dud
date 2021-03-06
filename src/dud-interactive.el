;; Dud is a very simple emacs configuration project meant to make
;; configuration very simple and thus the name.
;;
;;     Copyright (C) 2013  Satyam Shekhar
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
;; 02110-1301, USA.

(require 'profiler)

(defun dud-profile ()
 "Profile"
 (interactive)
 (profiler-start 'cpu+mem)
 (thoughtspot-c-rotate)
 (profiler-report))

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

(defun dud-current-line-to-top ()
    "Move the line point is on to top of window."
    (interactive)
    (recenter 0))

(defun dud-shell-command-bg ()
    "Start a shell command in backgroud."
    (interactive)
    (let ((command (read-string "Command: ")))
      (shell-command (concat command " &") (concat "*" command "*"))))

(defun dud-randomize-region (beg end)
  "Randomize lines in region from BEG to END."
  (interactive "*r")
  (let ((lines (split-string
                (delete-and-extract-region beg end) "\n")))
    (when (string-equal "" (car (last lines 1)))
      (setq lines (butlast lines 1)))
    (apply 'insert
           (mapcar 'cdr (sort (mapcar
                               (lambda (x)
                                 (cons (random)
                                       (concat x "\n"))) lines)
                              (lambda (a b) (< (car a) (car b))))))))

;; TODO(satyam): Improve this to keep the correct cursor position.
;; The following three functions are taken from an email thread.
(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))

(defun dud-change-number-at-point (change)
  "Change number at point."
  (let ((number (number-at-point))
        (point (point)))
    (when number
      (progn
        (forward-word)
        (search-backward (number-to-string number))
        (replace-match (number-to-string (funcall change number)))
        (goto-char point)))))
(defun dud-increment-number-at-point ()
  "Increment number at point."
  (interactive)
  (dud-change-number-at-point '1+))
(defun dud-decrement-number-at-point ()
  "Decrement number at point."
  (interactive)
  (dud-change-number-at-point '1-))

(provide 'dud-interactive)
