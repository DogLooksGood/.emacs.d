;;; Load the whole configuration
(load (expand-file-name "early-init.el" user-emacs-directory))
(load (expand-file-name "init.el" user-emacs-directory))

;;; Some packages to exclude during dump.
(setq +pdump-exclude-packages '(rime telega))

;;; Ensure every installed package is loaded.
(dolist (pkg +packages)
  (unless (member pkg +pdump-exclude-packages)
    (require pkg)))

;;; We have to unload tramp in pdump, otherwise tramp will not work.
(tramp-unload-tramp)

;;; We use this variable to test if we are starting with dump.
(setq +pdumped-load-path load-path
      +use-pdump t)

;;; Disable GC
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; dump image
(dump-emacs-portable "~/.emacs.d/emacs.pdmp")