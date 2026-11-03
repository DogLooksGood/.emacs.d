;; -*- lexical-binding: t; -*-

(defun simple-repeat-make-keymap (&rest commands)
  "Create a repeat keymap for COMMANDS."
  (let ((keymap (make-keymap)))
    (dolist (cmd commands)
      (advice-add cmd :after (lambda (&rest _r) (set-transient-map keymap))))
    keymap))

(provide 'simple-repeat)
