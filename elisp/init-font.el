;;; -*- lexical-binding: t -*-

(set-face-attribute 'default nil :font "Jetbrains Mono-11")

(setq face-font-rescale-alist '(("等距更纱黑体 SC" . 1)))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "等距更纱黑体 SC")))

(use-package ligature
  :straight
  (ligature :type git
	        :host github
	        :repo "mickeynp/ligature.el")
  :config
  (ligature-set-ligatures 'elixir-mode
                          '("->" "=>" "|>" "<-" ">=" "<=" "!=" "=="))
  (ligature-set-ligatures 'clojure-mode
                          '("->" "->>" ">=" "<="))
  (global-ligature-mode t))

(provide 'init-font)
