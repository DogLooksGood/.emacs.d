;; -*- lexical-binding: t; -*-

(defun completion-preview--update ()
  "Update completion preview."
  (seq-let (beg end props base common suffixes)
      (run-hook-wrapped
       'completion-at-point-functions
       #'completion-preview--capf-wrapper)
    (when-let* ((suffix (car suffixes))
                (inhibit-quit t))
      ;; Critical section, do not quit upon receiving input here.
      (set-text-properties 0 (length suffix)
                           (list 'face (if (cdr suffixes)
                                           'completion-preview
                                         'completion-preview-exact))
                           suffix)
      (set-text-properties 0 (length common)
                           (list 'face (if (cdr suffixes)
                                           'completion-preview-common
                                         'completion-preview-exact))
                           common)
      (let ((ov (completion-preview--make-overlay
                 end (completion-preview--propertize-for-mouse
                      (concat (substring common (- end beg)) suffix)))))
        (overlay-put ov 'completion-preview-beg beg)
        (overlay-put ov 'completion-preview-end end)
        (overlay-put ov 'completion-preview-index 0)
        (overlay-put ov 'completion-preview-suffixes suffixes)
        (overlay-put ov 'completion-preview-common common)
        (overlay-put ov 'completion-preview-base base)
        (overlay-put ov 'completion-preview-props props)
        (completion-preview-active-mode)))))

(provide 'completion-preview-patch)
