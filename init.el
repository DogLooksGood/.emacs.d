;; -*- lexical-binding: t; -*-

(require 'init-straight)

(let ((local-conf (expand-file-name "local.el" user-emacs-directory)))
  (when (file-exists-p local-conf)
    (load local-conf)))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(repeat-mode 1)

(with-eval-after-load "rect"
  (keymap-set rectangle-mark-mode-map "f"   #'forward-char)
  (keymap-set rectangle-mark-mode-map "b"   #'backward-char)
  (keymap-set rectangle-mark-mode-map "n"   #'next-line)
  (keymap-set rectangle-mark-mode-map "p"   #'previous-line)
  (keymap-set rectangle-mark-mode-map "a"   #'beginning-of-line)
  (keymap-set rectangle-mark-mode-map "e"   #'end-of-line)
  (keymap-set rectangle-mark-mode-map "SPC" #'string-rectangle)
  (keymap-set rectangle-mark-mode-map "DEL" #'kill-rectangle))

(keymap-unset next-error-repeat-map "n")
(keymap-unset next-error-repeat-map "p")

(with-eval-after-load "dired"
  (keymap-unset dired-jump-map "j"))

(defvar-keymap duplicate-dwim-repeat-map
  :repeat t "h" #'duplicate-dwim)

(require 'ansi-color)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(require 'bedit)
(straight-use-package '(xref :type built-in))
(straight-use-package '(project :type built-in))
(straight-use-package 'geiser)
(straight-use-package '(geiser-chez :host github :repo "DogLooksGood/geiser-chez"))
(straight-use-package 'gptel)
(straight-use-package 'envrc)
(straight-use-package 'paredit)
(straight-use-package 'corfu)
(straight-use-package 'cape)
(straight-use-package 'yasnippet)
(straight-use-package 'pass)
(straight-use-package 'dumb-jump)
(straight-use-package 'xclip)

(with-eval-after-load 'paredit
  (keymap-unset paredit-mode-map "M-s")
  (keymap-unset paredit-mode-map "M-r")
  (keymap-set paredit-mode-map "M-i" 'paredit-splice-sexp)
  (keymap-set paredit-mode-map "M-o" 'paredit-raise-sexp))

(dolist (h '(emacs-lisp-mode-hook scheme-mode-hook))
  (add-hook h 'paredit-mode))
(with-eval-after-load "paredit"
  (keymap-unset paredit-mode-map "RET"))

(require 'dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(require 'corfu)
(require 'cape)
(add-hook 'text-mode-hook #'corfu-mode)
(add-hook 'conf-mode-hook #'corfu-mode)
(add-hook 'prog-mode-hook #'corfu-mode)
(with-eval-after-load "corfu"
  (setq corfu-map
        (let ((map (make-keymap)))
          (keymap-set map "M-n" #'corfu-next)
          (keymap-set map "M-p" #'corfu-previous)
          map)))
;; (keymap-set corfu-mode-map "M-n" #'completion-at-point)
(add-hook 'completion-at-point-functions #'cape-dabbrev)
(add-hook 'completion-at-point-functions #'cape-file)

(fido-mode 1)

(with-eval-after-load "geiser-chez"
  (require 'patch-geiser))

(defun fido-backward-updir ()
  (interactive)
  (when (eq (icomplete--category) 'file)
    (when (string-equal (icomplete--field-string) "~/")
      (delete-region (icomplete--field-beg) (icomplete--field-end))
      (insert (expand-file-name "~/"))
      (goto-char (line-end-position)))
    (save-excursion
      (goto-char (1- (point)))
      (when (search-backward "/" (point-min) t)
        (delete-region (1+ (point)) (point-max))))))

(keymap-set icomplete-fido-mode-map "DEL" 'backward-delete-char)
(keymap-set icomplete-fido-mode-map "M-<backspace>" 'fido-backward-updir)
(keymap-set icomplete-fido-mode-map "M-DEL" 'fido-backward-updir)

(require 'envrc)
(envrc-global-mode t)

(require 'yasnippet)
(yas-load-directory (expand-file-name "snippets" user-emacs-directory))
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'conf-mode-hook 'yas-minor-mode)

(with-eval-after-load "cc-mode"
  (keymap-set c-mode-map "C-c o" #'ff-find-other-file))

(with-eval-after-load "gptel"
  (make-local-variable 'gptel-context))

(keymap-set mode-specific-map "RET" #'gptel-send)
(keymap-set mode-specific-map "a" #'gptel-add)
(keymap-set mode-specific-map "g" #'gptel)
(keymap-set mode-specific-map "R" #'gptel-rewrite)
(keymap-set mode-specific-map "s" #'window-toggle-side-windows)
(keymap-set mode-specific-map "w" #'window-swap-states)
(keymap-set mode-specific-map "l" #'recentf-open-files)
(keymap-set mode-specific-map "n" #'display-line-numbers-mode)
(keymap-set mode-specific-map "h" #'duplicate-dwim)
(keymap-set mode-specific-map "e" #'eglot)
(keymap-set mode-specific-map "c" #'bedit-extending-mode)
(keymap-set mode-specific-map "f" #'ffap)

(keymap-unset other-window-repeat-map "o")
(keymap-unset other-window-repeat-map "O")

(with-eval-after-load "org"
  (add-hook 'org-mode-hook 'org-indent-mode))

(with-eval-after-load "eglot"
  (keymap-set eglot-mode-map "M-RET" #'eglot-code-actions))

(with-eval-after-load "flymake"
  (keymap-set flymake-mode-map "C-c ! p" #'flymake-goto-prev-error)
  (keymap-set flymake-mode-map "C-c ! n" #'flymake-goto-next-error)
  (keymap-set flymake-mode-map "C-c ! !" #'flymake-show-buffer-diagnostics)
  (keymap-set flymake-mode-map "C-c ! c" #'flymake-show-diagnostic))

(add-hook 'before-save-hook #'delete-trailing-whitespace)

(add-hook 'buffer-list-update-hook #'recentf-track-opened-file)

(xclip-mode 1)
(xterm-mouse-mode 1)

(require 'server)
(unless (server-running-p)
  (server-start))
