;; -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'init-straight)

(require 'minidark-theme)
(load-theme 'minidark t)
