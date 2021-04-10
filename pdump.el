;;; load the whole configuration
(load (expand-file-name "early-init.el" user-emacs-directory))
(load (expand-file-name "init.el" user-emacs-directory))

;;; pdump every packages we marked
(dolist (pkg +pdump-packages)
  (require pkg))

;;; we use this variable to test if we are starting with dump.
(setq +pdumped-load-path load-path)

;; dump image
(dump-emacs-portable "~/.emacs.d/emacs.pdmp")
