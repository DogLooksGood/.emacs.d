

(straight-use-package 'smartparens)

(setq sp-autowrap-region nil)

(require 'smartparens)
(require 'smartparens-config)

(with-eval-after-load "smartparens"
  (define-key smartparens-mode-map (kbd "M-r") #'sp-raise-sexp)
  (define-key smartparens-mode-map (kbd "M-s") #'sp-unwrap-sexp)
  (define-key smartparens-mode-map (kbd "C-)") #'sp-forward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "C-}") #'sp-forward-barf-sexp))

(provide 'init-edit)
