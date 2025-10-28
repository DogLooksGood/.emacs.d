;; -*- lexical-binding: t; -*-

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(defun smart-C-t (_k)
  "Return C-x if it's the beginning of key sequence. Otherwise returns C-t."
  (let ((keys (this-command-keys)))
    (if (string-equal "" keys)
        ""
      "")))

(define-key key-translation-map (kbd  "C-t") 'smart-C-t)
(keymap-set global-map "C-x t" 'transpose-chars)

(with-eval-after-load "rect"
  (keymap-set rectangle-mark-mode-map "SPC" #'string-rectangle)
  (keymap-set rectangle-mark-mode-map "DEL" #'kill-rectangle))

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
	       "h" #'duplicate-dwim)

(require 'ansi-color)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(require 'bedit)

(straight-use-package 'clojure-mode)
(straight-use-package 'nix-ts-mode)
(straight-use-package 'geiser)
(straight-use-package 'geiser-guile)
(straight-use-package 'cider)
(straight-use-package 'gptel)
(straight-use-package 'paredit)
(straight-use-package 'yasnippet)
(straight-use-package 'envrc)
(straight-use-package 'magit)
(straight-use-package 'company)
(straight-use-package 'pass)
(straight-use-package 'eat)

(require 'company)
(require 'company-tng)
(global-company-mode 1)
(company-tng-configure-default)
(keymap-unset company-active-map "TAB")
(keymap-unset company-active-map "<tab>")
(keymap-unset company-active-map "C-n")
(keymap-unset company-active-map "C-p")
(keymap-set company-mode-map   "M-n" #'company-complete-common)
(keymap-set company-active-map "M-p" #'company-select-previous)
(keymap-set company-active-map "M-n" #'company-select-next)

(require 'envrc)
(envrc-global-mode 1)

(require 'yasnippet)
(yas-load-directory (expand-file-name "snippets" user-emacs-directory))
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'conf-mode-hook 'yas-minor-mode)

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

(with-eval-after-load "gptel"
  (make-local-variable 'gptel-context))

(keymap-set mode-specific-map "RET" #'gptel-send)
(keymap-set mode-specific-map "a" #'gptel-add)
(keymap-set mode-specific-map "g" #'gptel)
(keymap-set mode-specific-map "r" #'gptel-rewrite)
(keymap-set mode-specific-map "w" #'window-swap-states)
(keymap-set mode-specific-map "b" #'switch-to-buffer-other-window)
(keymap-set mode-specific-map "f" #'find-file-other-window)
(keymap-set mode-specific-map "d" #'dired-other-window)
(keymap-set mode-specific-map "i" #'info-other-window)
(keymap-set mode-specific-map "p" #'project-other-window-command)
(keymap-set mode-specific-map "l" #'recentf-open-files)
(keymap-set mode-specific-map "n" #'display-line-numbers-mode)
(keymap-set mode-specific-map "h" #'duplicate-dwim)
(keymap-set mode-specific-map "e" #'eglot)
(keymap-set mode-specific-map "c" #'bedit-extending-mode)

(with-eval-after-load "eglot"
  (keymap-set eglot-mode-map "M-RET" #'eglot-code-actions))

(with-eval-after-load "flymake"
  (keymap-set flymake-mode-map "C-c ! p" #'flymake-goto-prev-error)
  (keymap-set flymake-mode-map "C-c ! n" #'flymake-goto-next-error)
  (keymap-set flymake-mode-map "C-c ! !" #'flymake-show-buffer-diagnostics)
  (keymap-set flymake-mode-map "C-c ! c" #'flymake-show-diagnostic))

(add-hook 'before-save-hook #'delete-trailing-whitespace)

(add-hook 'buffer-list-update-hook #'recentf-track-opened-file)

(let ((local-conf (expand-file-name "local.el" user-emacs-directory)))
  (when (file-exists-p local-conf)
    (load local-conf)))
