;; -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'init-straight)

(require 'minidark-theme)
(require 'eink-theme)
(require 'simple-theme)

(let ((local-conf (expand-file-name "local.el" user-emacs-directory)))
  (when (file-exists-p local-conf)
    (load local-conf)))
