;; -*- lexical-binding: t; -*-

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(require 'carbon-theme)
(load-theme 'carbon t)

(require 'init-straight)

(require 'project)

(icomplete-mode 1)

(keymap-set icomplete-minibuffer-map "TAB" #'icomplete-force-complete)
(keymap-set icomplete-minibuffer-map "DEL" #'icomplete-fido-backward-updir)
(keymap-set icomplete-minibuffer-map "RET" #'icomplete-force-complete-and-exit)
(keymap-set icomplete-minibuffer-map "C-s" #'icomplete-forward-completions)
(keymap-set icomplete-minibuffer-map "C-r" #'icomplete-backward-completions)

(keymap-unset next-error-repeat-map "n")
(keymap-unset next-error-repeat-map "p")

(with-eval-after-load "dired"
  (keymap-unset dired-jump-map "j"))

(defvar-keymap duplicate-dwim-repeat-map :repeat t
	       "d" #'duplicate-dwim)

(require 'ansi-color)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(require 'bedit)
(keymap-set global-map "M-*" bedit-prefix-map)

(straight-use-package 'clojure-mode)
(straight-use-package 'nix-ts-mode)
(straight-use-package 'geiser)
(straight-use-package 'geiser-guile)
(straight-use-package 'cider)
(straight-use-package 'gptel)
(straight-use-package 'paredit)
(straight-use-package 'yasnippet)
(straight-use-package 'envrc)
(straight-use-package 'company)

(require 'company)
(require 'company-tng)
(global-company-mode 1)
(company-tng-configure-default)
(keymap-unset company-active-map "C-n")
(keymap-unset company-active-map "C-p")
(keymap-set company-active-map "M-p" #'company-select-previous)
(keymap-set company-active-map "M-n" #'company-select-next)

(require 'envrc)
(envrc-global-mode 1)

(require 'yasnippet)
(keymap-set global-map "C-c a" #'yas-expand)
(yas-load-directory (expand-file-name "snippets" user-emacs-directory))
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'conf-mode-hook 'yas-minor-mode)

(gptel-make-ollama "Ollama"
  :host "localhost:11434"
  :stream t
  :models '(deepseek-r1:32b gemma3:27b-it-q8_0 devstral:24b magistral:24b gpt-oss:20b))

(require 'paredit)
(keymap-unset paredit-mode-map "M-s")
(keymap-set paredit-mode-map "M-i" #'paredit-splice-sexp)

(add-hook 'emacs-lisp-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'scheme-mode-hook #'paredit-mode)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

(with-eval-after-load "cc-mode"
  (keymap-set c-mode-map "C-c C-c" #'ff-find-other-file))

(keymap-set global-map "C-c f" #'ffap)
(keymap-set global-map "C-c r" #'recentf-open-files)
(keymap-set prog-mode-map "C-c e" #'eglot)
(keymap-set global-map "C-c n" #'display-line-numbers-mode)
(keymap-set global-map "C-c d" #'duplicate-dwim)

(add-hook 'before-save-hook #'delete-trailing-whitespace)

(add-hook 'buffer-list-update-hook #'recentf-track-opened-file)

(let ((local-conf (expand-file-name "local.el" user-emacs-directory)))
  (when (file-exists-p local-conf)
    (load local-conf)))
