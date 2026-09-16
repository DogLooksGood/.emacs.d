(with-eval-after-load 'geiser
  (advice-add 'geiser-eval-buffer :around
	      (lambda (orig-fun &rest args)
		(save-mark-and-excursion
		  (goto-char (point-max))
		  (apply orig-fun args)))))

(defvar user/chez-debug-command-regexp
  (rx string-start
      (* space)
      (or "continue" "inspect" "reset" "quit" "help" "step" "car" "cdr"
          "c" "s" "sl" "f" "e" "r" "w" "i" "q" "n" "h" "?" "(debug)"
          "l" "u" "d" "t" "m" "p")
      (or string-end
          (seq (+ space) (* nonl) string-end)))
  "Regexp matching Chez debug/inspector commands.")

(defun user/geiser-input-filter (str)
  "Skip blank input; in Chez REPLs also skip debugger commands."
  (and (not (string-blank-p str))        ; comint's default check
       (or (not (eq geiser-impl--implementation 'chez))
           (not (string-match-p user/chez-debug-command-regexp str)))))

(with-eval-after-load "geiser-chez"
  (add-hook 'geiser-repl-startup-hook
            (lambda ()
              (setq-local comint-input-filter #'user/geiser-input-filter))))

(provide 'patch-geiser)
