;; -*- lexical-binding: t; -*-

(require 'init-straight)

(let ((local-conf (expand-file-name "local.el" user-emacs-directory)))
  (when (file-exists-p local-conf)
    (load local-conf)))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(with-eval-after-load "rect"
  (keymap-set rectangle-mark-mode-map "f"   #'forward-char)
  (keymap-set rectangle-mark-mode-map "b"   #'backward-char)
  (keymap-set rectangle-mark-mode-map "n"   #'next-line)
  (keymap-set rectangle-mark-mode-map "p"   #'previous-line)
  (keymap-set rectangle-mark-mode-map "a"   #'beginning-of-line)
  (keymap-set rectangle-mark-mode-map "e"   #'end-of-line)
  (keymap-set rectangle-mark-mode-map "SPC" #'string-rectangle)
  (keymap-set rectangle-mark-mode-map "DEL" #'kill-rectangle))

(require 'ansi-color)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(require 'bedit)
(straight-use-package 'geiser)
(straight-use-package '(geiser-chez :host github :repo "DogLooksGood/geiser-chez"))
(straight-use-package 'gptel)
(straight-use-package 'gptel-agent)
(straight-use-package 'envrc)
(straight-use-package 'corfu)
(straight-use-package 'cape)
(straight-use-package 'paredit)
(straight-use-package 'yasnippet)
(straight-use-package 'pass)
(straight-use-package 'rg)
(straight-use-package 'dumb-jump)
(straight-use-package 'vertico)

(require 'envrc)
(envrc-global-mode)

(require 'rg)
(keymap-set project-prefix-map "g" #'rg-dwim-project-dir)
(keymap-set project-prefix-map "r" #'rg-project)

(require 'paredit)
(dolist (h '(emacs-lisp-mode-hook scheme-mode-hook))
  (add-hook h #'paredit-mode))
(with-eval-after-load "paredit"
  (keymap-unset paredit-mode-map "M-s")
  (keymap-unset paredit-mode-map "M-?")
  (keymap-unset paredit-mode-map "C-j")
  (keymap-set paredit-mode-map "M-o" #'paredit-splice-sexp))

(require 'corfu)
(setq corfu-map
      (let ((map (make-keymap)))
        (keymap-set map "M-n" #'corfu-next)
        (keymap-set map "M-p" #'corfu-previous)
        map))
(add-hook 'prog-mode-hook #'corfu-mode)
(add-hook 'conf-mode-hook #'corfu-mode)

(require 'cape)
(add-hook 'completion-at-point-functions #'cape-dabbrev)
(add-hook 'completion-at-point-functions #'cape-file)

(require 'dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(require 'vertico)
(require 'vertico-flat)
(require 'vertico-directory)
(vertico-mode 1)
(vertico-flat-mode 1)
(keymap-set vertico-map "C-c f" #'vertico-flat-mode)
(keymap-set vertico-map "M-DEL" #'vertico-directory-delete-word)
(keymap-set vertico-map "C-s" #'vertico-next)
(keymap-set vertico-map "C-r" #'vertico-previous)

(require 'yasnippet)
(yas-load-directory (expand-file-name "snippets" user-emacs-directory))
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'conf-mode-hook 'yas-minor-mode)

(with-eval-after-load "cc-mode"
  (keymap-set c-mode-map "C-c =" #'align)
  (keymap-set c-mode-map "C-c o" #'ff-find-other-file))

(keymap-set mode-specific-map "a" #'gptel-add)
(keymap-set mode-specific-map "g" #'gptel)
(keymap-set mode-specific-map "s" #'window-toggle-side-windows)
(keymap-set mode-specific-map "l" #'recentf-open-files)
(keymap-set mode-specific-map "n" #'display-line-numbers-mode)
(keymap-set mode-specific-map "E" #'eglot)
(keymap-set mode-specific-map "c" #'bedit-extending-mode)
(keymap-set mode-specific-map "f" #'ffap)
(keymap-set mode-specific-map "C-j" #'duplicate-dwim)

(keymap-set global-map "C-j" #'repeat)

(with-eval-after-load "org"
  (add-hook 'org-mode-hook 'org-indent-mode))

(with-eval-after-load "eglot"
  (keymap-set eglot-mode-map "M-RET" #'eglot-code-actions))

(with-eval-after-load "flymake"
  (keymap-set flymake-mode-map "C-c ! p" #'flymake-goto-prev-error)
  (keymap-set flymake-mode-map "C-c ! n" #'flymake-goto-next-error)
  (keymap-set flymake-mode-map "C-c ! !" #'flymake-show-buffer-diagnostics)
  (keymap-set flymake-mode-map "C-c ! c" #'flymake-show-diagnostic))

(require 'simple-repeat)
(defcustom jump-error-keymap (simple-repeat-make-keymap #'next-error #'previous-error)
  "Keymap activated after an error jumping.")
(keymap-set jump-error-keymap "M-n" #'next-error)
(keymap-set jump-error-keymap "M-p" #'previous-error)

(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'buffer-list-update-hook #'recentf-track-opened-file)

(require 'server)
(unless (server-running-p)
  (server-start))
