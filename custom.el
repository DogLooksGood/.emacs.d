;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-list-file-prefix "~/.emacs.d/.local/auto-save-list/.saves-")
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(clojure-indent-keyword-style 'align-arguments)
 '(clojure-indent-style 'always-indent)
 '(company-backends
   '(company-capf company-files
                  (company-dabbrev-code company-etags company-keywords)
                  company-dabbrev))
 '(company-clang-insert-arguments nil t)
 '(company-format-margin-function 'company-text-icons-margin)
 '(company-require-match nil)
 '(company-semantic-insert-arguments nil t)
 '(company-tng-mode t)
 '(completion-styles '(basic partial-completion flex))
 '(corfu-auto t)
 '(corfu-auto-delay 0.1)
 '(corfu-auto-prefix 2)
 '(corfu-on-exact-match nil)
 '(corfu-preselect 'prompt)
 '(corfu-preview-current 'insert)
 '(custom-safe-themes
   '("abc4999450b3579e5ca79ae72350d8386069095a5cf6ab161aa062b35afe4275"
     "d453a6c05d97483ff577476a53188fa190e2a06e14ecb98d2d44034f5d825205"
     default))
 '(dired-dwim-target 'dired-dwim-target-recent)
 '(dired-listing-switches "-alh")
 '(dired-use-ls-dired t)
 '(display-buffer-alist
   '(("\\*\\(xref\\|grep\\)\\*" display-buffer-in-side-window
      (side . right) (slot . 0) (window-width . 0.4))
     ("\\*compilation\\*" display-buffer-in-side-window
      (side . bottom) (slot . 0) (window-height . 0.4))
     ("\\*Async Shell Command\\*" display-buffer-in-side-window
      (side . bottom) (slot . 1) (window-height . 0.4))))
 '(eglot-code-action-indicator "?")
 '(eglot-ignored-server-capabilities
   '(:referencesProvider :documentHighlightProvider
                         :documentSymbolProvider
                         :workspaceSymbolProvider :codeLensProvider
                         :documentOnTypeFormattingProvider
                         :colorProvider :foldingRangeProvider
                         :executeCommandProvider :inlayHintProvider
                         :typeHierarchyProvider :callHierarchyProvider))
 '(envrc-global-mode t)
 '(envrc-show-summary-in-minibuffer nil)
 '(font-use-system-font t)
 '(gdb-many-windows t)
 '(global-company-mode t)
 '(global-corfu-mode t)
 '(global-subword-mode t)
 '(gptel-default-mode 'org-mode)
 '(gptel-prompt-prefix-alist '((org-mode . "* ")))
 '(icomplete-hide-common-prefix nil)
 '(icomplete-mode t)
 '(imenu-flatten 'annotation)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(isearch-lazy-count t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(mode-line-collapse-minor-modes t)
 '(mode-line-compact t)
 '(mouse-wheel-progressive-speed nil)
 '(package-selected-packages '(company envrc yasnippet))
 '(pass-username-fallback-on-filename t)
 '(project-list-file "~/.emacs.d/.local/projects.eld")
 '(project-mode-line nil)
 '(project-switch-commands
   '((project-find-file "Find file" nil)
     (project-find-regexp "Find regexp" nil)
     (project-find-dir "Find directory" nil)
     (project-vc-dir "VC-Dir" nil) (project-eshell "Eshell" nil)
     (project-any-command "Other" nil)
     (magit-project-status "Git" 103)))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(recentf-mode t)
 '(recentf-save-file "~/.emacs.d/.local/recentf.eld")
 '(repeat-mode t)
 '(safe-local-variable-values
   '((geiser-guile-binary . "./cli")
     (geiser-guile-init-file . "test.scm")
     (geiser-guile-binary . "./main")
     (geiser-guile-binary . "../main") (geiser-guile-binary . "main")))
 '(savehist-file "~/.emacs.d/.local/history")
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-style 'parenthesis)
 '(straight-check-for-modifications '(find-when-checking only-once))
 '(tool-bar-mode nil)
 '(transient-history-file "~/.emacs.d/.local/transient/history.el")
 '(transient-levels-file "~/.emacs.d/.local/transient/levels.el")
 '(transient-values-file "~/.emacs.d/.local/transient/values.el")
 '(typescript-ts-mode-indent-offset 4)
 '(use-short-answers t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
