(advice-add 'geiser-eval-buffer :around
	    (lambda (orig-fun &rest args)
	      (save-mark-and-excursion
		(goto-char (point-max))
		(apply orig-fun args))))

(provide 'patch-geiser)
