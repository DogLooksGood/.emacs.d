;;; Load the whole configuration
(load (expand-file-name "early-init.el" user-emacs-directory))
(load (expand-file-name "init.el" user-emacs-directory))

;;; Ensure every installed package is loaded.
(+measure-time-1
 (dolist (pkg +pdump-packages)
   (require pkg)))

;;; We have to unload tramp in pdump, otherwise tramp will not work.
(tramp-unload-tramp)

;;; We use this variable to test if we are starting with dump.
(setq +pdumped-load-path load-path
      +use-pdump t)

;; dump image
(dump-emacs-portable "~/.emacs.d/emacs.pdmp")
