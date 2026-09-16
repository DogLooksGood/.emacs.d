;;; simple-theme.el --- A greenish theme  -*- lexical-binding: t; -*-

(deftheme phosphorus "A greenish theme")

(let* ((bg        "#0a1a0a")   ; dark green, L≈0.008
       (bg-1      "#12321a")   ; subtle highlight
       (bg-2      "#1a3a1a")   ; medium  (region)
       (bg-3      "#224022")   ; stronger (search / lazy)
       (fg        "#d8c458")   ; yellow, ratio ≈ 10.3:1

       ;; --- Syntax palette ---
       ;; orange -> red, all with luminance ≈ 0.55, all ≈ 10:1
       (orange    "#f4b878")   ; 10.3:1
       (amber     "#f8b090")   ; 10.0:1
       (coral     "#fcb0a8")   ; 10.2:1
       (red-lt    "#ffb4b8")   ; 10.7:1

       ;; --- Green family (truthy / comments / links) ---
       (green-lt  "#a0e090")   ; truthy green   11.6:1
       (green-md  "#a8d090")   ; comments       10.4:1
       (cyan-lt   "#90e0d0")   ; links/teletype 11.8:1
       (blue-lt   "#b0c8ff")   ; 10.8:1
       (magenta-lt"#ffb4d0")   ; 10.9:1

       ;; --- Neutrals ---
       (dim       "#5a6a5a")   ; muted green-gray
       (dim-2     "#3a4a3a")
       (white-soft "#e8e8e0")
       (black-soft "#050d05"))

  (custom-theme-set-faces
   'phosphorus

   ;; ````` Basics `````````````````````````````````````````````````````
   `(cursor                     ((t (:background ,fg))))
   `(default                    ((t (:foreground ,fg :background ,bg))))
   `(region                     ((t (:background ,bg-2))))     ; lighter bg
   `(shadow                     ((t (:foreground ,dim))))
   `(error                      ((t (:foreground ,red-lt))))
   `(button                     ((t (:underline t))))

   ;; ````` Chrome `````````````````````````````````````````````````````
   `(mode-line                  ((t (:foreground ,fg        :background ,bg-3))))
   `(mode-line-inactive         ((t (:foreground ,dim       :background ,bg-1))))
   `(line-number                ((t (:foreground ,dim))))
   `(line-number-current-line   ((t (:foreground ,fg))))

   ;; ````` Search / selection (bg-only highlights) ````````````````````
   `(lazy-highlight             ((t (:background ,bg-3))))     ; lighter bg
   `(secondary-selection        ((t (:background ,bg-2))))     ; lighter bg
   `(trailing-whitespace        ((t (:background ,bg-1))))     ; subtle bg
   `(show-paren-match           ((t (:weight bold :underline t))))

   ;; ````` Diagnostics ````````````````````````````````````````````````
   `(flymake-note               ((t (:underline (:color ,green-lt :style dots)))))
   `(flymake-warning            ((t (:underline (:color ,amber    :style dots)))))
   `(flymake-error              ((t (:underline (:color ,red-lt   :style wave)))))
   `(compilation-error          ((t (:foreground ,red-lt))))
   `(eglot-diagnostic-tag-deprecated-face  ((t (:underline (:color ,amber :style dots)))))
   `(eglot-diagnostic-tag-unnecessary-face ((t (:underline (:color ,amber :style dots)))))

   ;; ````` Font lock ``````````````````````````````````````````````````
   ;; comments keep the greenish hue (they belong to the "green family")
   `(font-lock-comment-face           ((t (:foreground ,green-md))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,green-md))))
   `(font-lock-doc-face               ((t (:foreground ,green-md :slant italic))))
   `(font-lock-doc-markup-face        ((t (:foreground ,green-md))))
   ;; syntax keywords/functions: orange -> red, all ≈ 10:1
   `(font-lock-function-name-face     ((t (:foreground ,orange))))
   `(font-lock-keyword-face           ((t (:foreground ,coral))))
   `(font-lock-preprocessor-face      ((t (:foreground ,red-lt))))
   ;; truthy: lighter green;  falsy: lighter red
   `(font-lock-constant-face          ((t (:foreground ,green-lt))))
   `(highlight-numbers-number         ((t (:foreground ,amber))))

   ;; ````` Links / Info ``````````````````````````````````````````````
   `(info-xref                  ((t (:foreground ,cyan-lt :underline t))))
   `(info-xref-visited          ((t (:foreground ,magenta-lt :underline t))))
   `(org-link                   ((t (:foreground ,cyan-lt :underline t))))

   ;; ````` Completion `````````````````````````````````````````````````
   `(company-tooltip                    ((t (:foreground ,fg  :background ,bg-2))))
   `(company-tooltip-selection          ((t (:foreground ,bg  :background ,fg))))
   `(company-tooltip-scrollbar-thumb    ((t (:background ,dim))))
   `(company-tooltip-scrollbar-track    ((t (:background ,bg-1))))
   `(vertico-current                    ((t (:foreground ,bg  :background ,fg))))
   `(comint-highlight-prompt            ((t (:foreground ,cyan-lt))))

   ;; ````` Dired ``````````````````````````````````````````````````````
   `(dired-directory            ((t (:foreground ,amber))))
   `(dired-ignored              ((t (:foreground ,dim))))
   `(dired-symlink              ((t (:foreground ,cyan-lt))))

   ;; ````` Org ````````````````````````````````````````````````````````
   `(org-block-begin-line       ((t (:foreground ,dim))))
   `(org-block-end-line         ((t (:foreground ,dim))))
   `(org-done                   ((t (:foreground ,green-lt))))   ; truthy
   `(org-todo                   ((t (:foreground ,red-lt))))     ; falsy
   `(org-hide                   ((t (:foreground ,bg))))
   `(org-indent                 ((t (:foreground ,bg))))
   `(org-verbatim               ((t (:foreground ,amber))))

   ;; ````` Magit ``````````````````````````````````````````````````````
   `(magit-diff-file-heading    ((t (:weight bold :foreground ,fg))))

   ;; ````` Transient ``````````````````````````````````````````````````
   `(transient-active-infix     ((t (:foreground ,orange))))
   `(transient-argument         ((t (:foreground ,amber))))
   `(transient-disabled-suffix  ((t (:foreground ,dim))))
   `(transient-enabled-suffix   ((t (:foreground ,green-lt))))
   `(transient-heading          ((t (:foreground ,fg :weight bold))))
   `(transient-inactive-value   ((t (:foreground ,dim))))
   `(transient-key              ((t (:foreground ,cyan-lt))))
   `(transient-key-exit         ((t (:foreground ,red-lt))))
   `(transient-key-return       ((t (:foreground ,green-lt))))
   `(transient-value            ((t (:foreground ,fg))))

   ;; ````` Misc ```````````````````````````````````````````````````````
   `(smerge-markers             ((t (:background ,bg-2))))
   `(xref-file-header           ((t (:foreground ,fg :background ,bg-3 :weight bold))))
   `(rg-file-tag-face           ((t (:foreground ,amber))))
   `(rg-filename-face           ((t (:foreground ,orange))))
   `(gptel-context-highlight-face ((t (:background ,bg-2))))

   ;; ````` ANSI / terminal ````````````````````````````````````````````
   `(ansi-color-black           ((t (:foreground ,black-soft))))
   `(ansi-color-red             ((t (:foreground ,red-lt))))
   `(ansi-color-green           ((t (:foreground ,green-lt))))
   `(ansi-color-yellow          ((t (:foreground ,fg))))
   `(ansi-color-blue            ((t (:foreground ,blue-lt))))
   `(ansi-color-magenta         ((t (:foreground ,magenta-lt))))
   `(ansi-color-cyan            ((t (:foreground ,cyan-lt))))
   `(ansi-color-teal            ((t (:foreground ,cyan-lt))))     ; legacy name
   `(ansi-color-white           ((t (:foreground ,white-soft))))

   `(ansi-color-bright-black    ((t (:foreground ,dim))))
   `(ansi-color-bright-red      ((t (:foreground "#ffc8c8"))))
   `(ansi-color-bright-green    ((t (:foreground "#b8f0b0"))))
   `(ansi-color-bright-yellow   ((t (:foreground "#e8d880"))))
   `(ansi-color-bright-blue     ((t (:foreground "#c8d8ff"))))
   `(ansi-color-bright-magenta  ((t (:foreground "#ffc8e0"))))
   `(ansi-color-bright-cyan     ((t (:foreground "#b0f0e0"))))
   `(ansi-color-bright-teal     ((t (:foreground "#b0f0e0"))))
   `(ansi-color-bright-white    ((t (:foreground "#f8f8f0"))))

   `(ansi-color-bold            ((t (:weight bold))))
   `(ansi-color-faint           ((t (:foreground ,dim))))
   `(ansi-color-inverse         ((t (:inverse-video t))))
   `(ansi-color-italic          ((t (:slant italic))))
   `(ansi-color-underline       ((t (:underline t))))))

(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'phosphorus)
;;; phosphorus-theme.el ends here
