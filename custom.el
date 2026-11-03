;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-additional-directory-list '("~/.local/share/info"))
 '(align-rules-list
   '((lisp-second-arg
      (regexp . "\\(^\\s-+[^( \11\12]\\|(\\(\\S-+\\)\\s-+\\)\\S-+\\(\\s-+\\)")
      (group . 3) (modes . align-lisp-modes)
      (run-if . #[0 "\10\207" [current-prefix-arg] 1]))
     (lisp-alist-dot (regexp . "\\(\\s-*\\)\\.\\(\\s-*\\)") (group 1 2)
		     (modes . align-lisp-modes))
     (open-comment
      (regexp
       . #[514 "\211\203\10\0\301\202\11\0\302\303\304\10!\305Q\3\306#\207"
	       [comment-start re-search-backward re-search-forward
			      "[^ \11\12\\]" regexp-quote "\\(.+\\)$" t]
	       6 "\12\12(fn END REVERSE)"])
      (modes . align-open-comment-modes))
     (c-macro-definition (regexp . "^\\s-*#\\s-*define\\s-+\\S-+\\(\\s-+\\)")
			 (modes . align-c++-modes))
     (c-variable-declaration
      (regexp
       . "[*&0-9A-Za-z_]>?[][&*]*\\(\\s-+[*&]*\\)[A-Za-z_][][0-9A-Za-z:_]*\\s-*\\(\\()\\|=[^=\12].*\\|(.*)\\|\\(\\[.*\\]\\)*\\)\\s-*[;,]\\|)\\s-*$\\)")
      (group . 1) (modes . align-c++-modes) (justify . t)
      (valid
       . #[0
	   "\212\301\224b\210\302v\210\303\304!)\206\"\0\10\203\34\0\305`\306\"\307=\202\"\0\310 @@\311=?\207"
	   [font-lock-mode 1 -1 looking-at
			   "\\(goto\\|return\\|new\\|delete\\|throw\\)"
			   get-text-property face font-lock-comment-face
			   c-guess-basic-syntax c]
	   3]))
     (c-assignment
      (regexp
       . "[^-=!^&*+<>/| \11\12]\\(\\s-*[-=!^&*+<>/|]*\\)=\\(\\s-*\\)\\([^= \11\12]\\|$\\)")
      (group 1) (modes . align-c++-modes) (justify . t) (tab-stop . t))
     (perl-assignment
      (regexp
       . "[^=!^&*+<>/| \11\12-]\\(\\s-*\\)=[~>]?\\(\\s-*\\)\\([^>= \11\12]\\|$\\)")
      (group 1 2) (modes . align-perl-modes) (tab-stop))
     (python-assignment
      (regexp . "[^=!<> \11\12]\\(\\s-*\\)=\\(\\s-*\\)\\([^>= \11\12]\\|$\\)")
      (group 1 2) (modes quote (python-base-mode)) (tab-stop))
     (make-assignment
      (regexp . "^\\s-*\\w+\\(\\s-*\\):?=\\(\\s-*\\)\\([^\11\12 \\]\\|$\\)")
      (group 1 2) (modes quote (makefile-mode)) (tab-stop))
     (c-comma-delimiter (regexp . ",\\(\\s-*\\)[^/ \11\12]") (repeat . t)
			(modes . align-c++-modes)
			(run-if . #[0 "\10\207" [current-prefix-arg] 1]))
     (basic-comma-delimiter (regexp . ",\\(\\s-*\\)[^# \11\12]") (repeat . t)
			    (modes append align-perl-modes '(python-base-mode))
			    (run-if . #[0 "\10\207" [current-prefix-arg] 1]))
     (c++-comment (regexp . "\\(\\s-*\\)\\(//.*\\|/\\*.*\\*/\\s-*\\)$")
		  (modes . align-c++-modes) (column . comment-column)
		  (valid . #[0 "\212\300\224b\210n)?\207" [1] 1]))
     (c-chain-logic (regexp . "\\(\\s-*\\)\\(&&\\|||\\|\\<and\\>\\|\\<or\\>\\)")
		    (modes . align-c++-modes)
		    (valid
		     . #[0 "\212\300\225b\210\301\302!)\207"
			   [2 looking-at "\\s-*\\(/[*/]\\|$\\)"] 2]))
     (perl-chain-logic
      (regexp . "\\(\\s-*\\)\\(&&\\|||\\|\\<and\\>\\|\\<or\\>\\)")
      (modes . align-perl-modes)
      (valid
       . #[0 "\212\300\225b\210\301\302!)\207" [2 looking-at "\\s-*\\(#\\|$\\)"]
	     2]))
     (python-chain-logic (regexp . "\\(\\s-*\\)\\(\\<and\\>\\|\\<or\\>\\)")
			 (modes quote (python-base-mode))
			 (valid
			  . #[0 "\212\300\225b\210\301\302!)\207"
				[2 looking-at "\\s-*\\(#\\|$\\|\\\\\\)"] 2]))
     (c-macro-line-continuation (regexp . "\\(\\s-*\\)\\\\$")
				(modes . align-c++-modes)
				(column . c-backslash-column))
     (basic-line-continuation (regexp . "\\(\\s-*\\)\\\\$")
			      (modes quote (python-base-mode makefile-mode)))
     (tex-record-separator
      (regexp
       . #[514 "\300\301\3\3#\207" [align-match-tex-pattern "&"] 6
	       "\12\12(fn END REVERSE)"])
      (group 1 2) (modes . align-tex-modes) (repeat . t))
     (tex-tabbing-separator
      (regexp
       . #[514 "\300\301\3\3#\207" [align-match-tex-pattern "\\\\[=>]"] 6
	       "\12\12(fn END REVERSE)"])
      (group 1 2) (modes quote (latex-mode)) (repeat . t))
     (tex-record-break (regexp . "\\(\\s-*\\)\\\\\\\\")
		       (modes . align-tex-modes))
     (text-column (regexp . "\\(^\\|\\S-\\)\\([ \11]+\\)\\(\\S-\\|$\\)")
		  (group . 2) (modes . align-text-modes) (repeat . t)
		  (run-if
		   . #[0 "\10\302=?\205\13\0\303\11!?\207"
			 [current-prefix-arg align-tex-modes - derived-mode-p] 2]))
     (text-dollar-figure (regexp . "\\$?\\(\\s-+[0-9]+\\)\\.")
			 (modes . align-text-modes) (justify . t)
			 (run-if . #[0 "\10\301=\207" [current-prefix-arg -] 2]))
     (css-declaration (regexp . "^\\s-*\\(?:\\w-?\\)+:\\(\\s-*\\).*;") (group 1)
		      (modes quote (css-base-mode html-mode)))
     (toml-assignment (regexp . "\\(\\s-*\\)=\\(\\s-*\\)") (group 1 2)
		      (modes quote (conf-toml-mode lua-mode)))
     (double-dash-comment (regexp . "\\(\\s-*\\)--.*") (modes quote (lua-mode))
			  (column . comment-column)
			  (valid . #[0 "\212\300\224b\210n)?\207" [1] 1]))))
 '(align-to-tab-stop t)
 '(auto-save-list-file-prefix "~/.emacs.d/.cache/auto-save-list/.saves-")
 '(blink-cursor-interval 0.3)
 '(blink-cursor-mode nil)
 '(c-basic-offset 'set-from-style)
 '(c-default-style
   '((c-mode . "gnu") (java-mode . "java") (awk-mode . "awk") (other . "gnu")))
 '(c-indent-comment-alist 'set-from-style)
 '(clojure-indent-keyword-style 'align-arguments)
 '(clojure-indent-style 'always-indent)
 '(clojure-toplevel-inside-comment-form t)
 '(comment-empty-lines t)
 '(company-backends
   '(company-capf company-files
		  (company-dabbrev-code company-etags company-keywords)
		  company-dabbrev))
 '(company-clang-insert-arguments nil t)
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(company-format-margin-function 'company-text-icons-margin)
 '(company-frontends
   '(company-tng-frontend company-childframe-unless-just-one-frontend
			  company-echo-metadata-frontend
			  company-preview-if-just-one-frontend))
 '(company-idle-delay 0.1)
 '(company-require-match nil)
 '(company-semantic-insert-arguments nil t)
 '(company-tng-auto-configure nil)
 '(company-tng-mode nil)
 '(company-transformers '(delete-dups))
 '(compilation-auto-jump-to-first-error nil)
 '(compilation-skip-threshold 1)
 '(compilation-skip-visited nil)
 '(completion-category-overrides '((file (styles partial-completion))))
 '(completions-format 'one-column)
 '(completions-max-height 20)
 '(corfu-auto t)
 '(corfu-auto-delay 0.1)
 '(corfu-auto-prefix 2)
 '(corfu-on-exact-match nil)
 '(corfu-preselect 'prompt)
 '(corfu-preview-current 'insert)
 '(custom-safe-themes
   '("63648ff9df5830a09a2daa22b371a2c31913cb86c9a21292df5cebb6cdfff045"
     "1db40cdfadf3c207549aa8ba786942a8d5671825ff3b2a51cb2b8fd93a902ee1" default))
 '(dired-dwim-target 'dired-dwim-target-recent)
 '(dired-listing-switches "-alhv --group-directories-first")
 '(dired-use-ls-dired t)
 '(display-buffer-alist
   '(("\\*\\(xref\\|grep\\|rg\\)\\*" display-buffer-in-side-window (side . left)
      (slot . 0) (window-width . 0.4))
     ("\\*eldoc\\*" display-buffer-in-side-window (side . right) (slot . -1)
      (window-width . 0.5))
     ("\\*compilation\\*" display-buffer-reuse-mode-window (side . bottom)
      (slot . 0) (window-height . 0.5))
     ("\\*Async Shell Command\\*" display-buffer-reuse-mode-window
      (side . bottom) (slot . 1) (window-height . 0.5))))
 '(eglot-code-action-indicator "?")
 '(eglot-ignored-server-capabilities
   '(:referencesProvider :documentHighlightProvider :documentSymbolProvider
			 :workspaceSymbolProvider :codeLensProvider
			 :documentOnTypeFormattingProvider :colorProvider
			 :foldingRangeProvider :executeCommandProvider
			 :inlayHintProvider :typeHierarchyProvider
			 :callHierarchyProvider :hoverProvider))
 '(eldoc-echo-area-use-multiline-p nil)
 '(envrc-global-mode t)
 '(envrc-show-summary-in-minibuffer nil)
 '(epg-pinentry-mode 'loopback)
 '(ff-ignore-include t)
 '(fido-mode nil)
 '(fill-column 80)
 '(font-use-system-font t)
 '(frame-resize-pixelwise t)
 '(geiser-chez-browse-function 'browse-url-firefox)
 '(geiser-chez-csug-url
   "file:///home/tianshu/websites/csug/cisco.github.io/ChezScheme/csug/")
 '(geiser-chez-tspl-url "file:///home/tianshu/websites/tspl/scheme.com/tspl4/")
 '(geiser-repl-save-debugging-history-p nil)
 '(global-auto-revert-mode t)
 '(global-company-mode t)
 '(global-completion-preview-mode nil)
 '(global-corfu-mode t)
 '(global-subword-mode t)
 '(global-visual-line-mode t)
 '(gptel-default-mode 'org-mode)
 '(gptel-prompt-prefix-alist '((org-mode . "* ")))
 '(gptel-use-curl t)
 '(imenu-flatten 'annotation)
 '(inhibit-startup-screen t)
 '(isearch-lazy-count t)
 '(js-indent-level 4)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(mode-line-collapse-minor-modes t)
 '(mode-line-compact t)
 '(mouse-wheel-progressive-speed nil)
 '(org-babel-load-languages '((emacs-lisp . t) (shell . t)))
 '(org-hide-emphasis-markers t)
 '(package-selected-packages '(company envrc yasnippet))
 '(pass-show-keybindings nil)
 '(pass-username-fallback-on-filename t)
 '(project-list-file "~/.emacs.d/.cache/projects.eld")
 '(project-mode-line nil)
 '(project-switch-commands
   '((project-find-file "Find file" nil) (project-find-regexp "Find regexp" nil)
     (project-find-dir "Find directory" nil) (project-vc-dir "VC-Dir" nil)
     (project-eshell "Eshell" nil) (project-any-command "Other" nil)))
 '(puni-confirm-when-delete-unbalanced-active-region nil)
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(recentf-mode t)
 '(recentf-save-file "~/.emacs.d/.cache/recentf.eld")
 '(rectangle-indicate-zero-width-rectangle t)
 '(repeat-mode nil)
 '(rg-custom-type-aliases '(("scm" . "*.scm") ("scm" . "*.ss") ("scm" . "*.sls")))
 '(ring-bell-function 'ignore)
 '(safe-local-variable-values
   '((typescript-indent-level . 2) (geiser-guile-binary . "./build/main")))
 '(save-place-file "~/.emacs.d/.cache/places.eld")
 '(save-place-mode t)
 '(savehist-file "~/.emacs.d/.cache/history")
 '(savehist-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-style 'parenthesis)
 '(speedbar-use-images nil)
 '(straight-check-for-modifications '(find-when-checking only-once))
 '(tool-bar-mode nil)
 '(transient-history-file "~/.emacs.d/.cache/transient/history.el")
 '(transient-levels-file "~/.emacs.d/.cache/transient/levels.el")
 '(transient-values-file "~/.emacs.d/.cache/transient/values.el")
 '(typescript-ts-mode-indent-offset 4)
 '(tzc-favourite-time-zones-alist
   '(("Asia/Shanghai" "Shanghai") ("UTC+0000" "UTC")
     ("America/New_York" "New_York") ("Europe/London" "London")
     ("Europe/Berlin" "Berlin") ("Asia/Kolkata" "Kolkata")
     ("Asia/Tokyo" "Tokyo") ("Asia/Dubai" "Dubai") ("America/Chicago" "Chicago")))
 '(tzc-time-zones
   '("Asia/Kolkata" "UTC+0000" "America/New_York" "Europe/London" "Europe/Berlin"
     "Asia/Shanghai" "Asia/Tokyo" "Asia/Dubai" "Asia/Kolkata" "Europe/Moscow"))
 '(url-cookie-file "~/.emacs.d/.cache/url/cookies")
 '(use-short-answers t)
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
