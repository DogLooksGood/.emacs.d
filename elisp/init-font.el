;;; -*- lexical-binding: t; -*-

(when window-system
  ;; ligature

  (require 'ligature)

  (global-ligature-mode t)

  (with-eval-after-load "ligature"
    (ligature-set-ligatures 'emacs-lisp-mode
                            '("->" "->>" "<=" ">="))
    (ligature-set-ligatures 'elixir-mode
                            '("->" "=>" "|>" "<-" ">=" "<=" "!=" "!==" "===" "==" "::" "++" "&&" "||" "<<" ">>"))
    (ligature-set-ligatures 'clojure-mode
                            '("->" "->>" ">=" "<="  ".-"))
    (ligature-set-ligatures 'web-mode
                            '("</" "<!--" "-->" "/>"))))

(provide 'init-font)
