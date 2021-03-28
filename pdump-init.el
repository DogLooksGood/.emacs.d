;; Restore the load path
(setq load-path +pdumped-load-path)

;; Disable error message
(setq warning-minimum-level :emergency)

;; Some shim code for tramp
(defun tramp-file-name-method--cmacro (&rest args))
(require 'tramp)
(setq tramp-mode 1)

;; These two modes are disabled in pdump
(global-font-lock-mode t)
(meow-esc-mode 1)
(transient-mark-mode t)
