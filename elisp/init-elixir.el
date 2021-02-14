;;; -*- lexical-binding: t; -*-

(straight-use-package 'elixir-mode)

(straight-use-package 'mix)

(straight-use-package
 '(inf-iex :type git
	       :host github
	       :repo "DogLooksgood/inf-iex"))

;;; Custom functions

(defface +elixir-dim-face
  '((((class color) (background dark))
     (:foreground "grey60"))
    (((class color) (background light))
     (:foreground "grey40")))
  "Elixir dim face.")

(defun +elixir-auto-module-name ()
  (let* ((file-name (+smart-file-name))
         (lib-file-name (cond
                         ((string-prefix-p "lib/" file-name)
                          (substring file-name 4))
                         ((string-prefix-p "test/" file-name)
                          (substring file-name 5))
                         (t file-name))))
    (message file-name)
    (-> (replace-regexp-in-string "\.exs?$" "" lib-file-name)
        (split-string "/")
        (->> (-map #'+to-pascal-case))
        (string-join "."))))

(defun +elixir-post-self-insert-hook-setup ()
  (add-hook 'post-self-insert-hook '+elixir-handle-input nil t))

(defun +elixir-handle-input ()
  (unless (or (+in-string-p) (+in-comment-p))
    (cond
     ((looking-back ",,$" 2)
      (backward-delete-char 2)
      (insert "|> "))
     ((looking-back "<-" 2))
     ((looking-back "[[:graph:]]-" 2)
      (backward-delete-char 1)
      (insert "_"))
     ((looking-back ";" 2)
      (backward-delete-char 1)
      (insert ":")))))

;;; inf-iex

(custom-set-variables
 '(inf-iex-default-iex-command "iex -S mix phx.server"))

(autoload #'inf-iex-minor-mode "inf-iex")

;;; elixir-mode

(autoload #'elixir-mode "elixir-mode")

(with-eval-after-load "elixir-mode"
  (font-lock-add-keywords 'elixir-mode
                          '(("\\([_a-zA-Z0-9!?]+\\):" 1 'default)
                            (":[_a-zA-Z0-9\"!?]+" . font-lock-constant-face)
                            ("\\_<true\\_>" . font-lock-constant-face)
                            ("\\_<false\\_>" . font-lock-constant-face)
                            ("\\_<nil\\_>" . font-lock-constant-face)
                            ("\\_<_[a-zA-Z0-9]*\\_>" . '+elixir-dim-face)))
  (modify-syntax-entry ?& "'" elixir-mode-syntax-table)

  (add-hook 'elixir-mode-hook '+elixir-post-self-insert-hook-setup)
  (add-hook 'elixir-mode-hook 'electric-pair-local-mode)

  (define-key elixir-mode-map (kbd "C-c C-f") 'elixir-format)
  (define-key elixir-mode-map (kbd "C-c C-t t") 'mix-test)
  (define-key elixir-mode-map (kbd "C-c C-t b") 'mix-test-current-buffer)
  (define-key elixir-mode-map (kbd "C-c C-t c") 'mix-test-current-test))

;;; mix

(autoload #'mix-test "mix")
(autoload #'mix-test-current-buffer "mix")
(autoload #'mix-test-current-test "mix")

(provide 'init-elixir)
