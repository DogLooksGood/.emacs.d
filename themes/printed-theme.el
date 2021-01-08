(deftheme printed "A simple medium contrast light theme.")

(custom-theme-set-faces
 'printed
 `(default                        ((((type tty))
									:background "#f8f8f8")
                                   (((type graphic))
                                    :background "#f8f8f8"
                                    :foreground "#333333")))
 `(hl-line                        ((((type graphic))
                                    :background "#eeeeee"
                                    :overline "#9999cc" :underline "#9999cc")
                                   (((type tty))
                                    :background "#ffffff")))
 `(cursor                         ((t (:background "black"))))
 '(region                         ((t (:background "#b6e3fa"))))
 '(fringe                         ((t ())))
 `(font-lock-comment-face         ((t (:foreground "dark green" :italic t))))
 `(font-lock-doc-face             ((t (:foreground "dark green" :italic t))))
 `(font-lock-warning-face         ((t (:foreground "red"))))
 `(font-lock-string-face          ((t (:foreground "dark red"))))
 `(font-lock-function-name-face   ((t (:bold t))))
 `(font-lock-keyword-face         ((t (:foreground "DarkBlue"))))
 `(font-lock-constant-face        ((t (:foreground "Purple4"))))
 `(font-lock-builtin-face         ((t ())))
 `(font-lock-variable-name-face   ((t ())))
 `(font-lock-type-face            ((t ())))
 `(font-lock-preprocessor-face    ((t (:inherit font-lock-constant-face))))
 '(meow-keypad-indicator          ((t (:bold t))))
 '(meow-insert-indicator          ((t (:bold t))))
 '(meow-normal-indicator          ((t (:bold t))))
 '(meow-motion-indicator          ((t (:bold t))))
 '(meow-keypad-cursor             ((t (:background "#7c2902"))))
 '(meow-insert-cursor             ((t (:background "#014f39"))))
 '(meow-normal-cursor             ((t (:background "#9b034c"))))
 '(meow-motion-cursor             ((t (:background "#035063"))))
 '(dired-directory                ((t (:bold t))))
 '(mode-line                      ((((type tty)) (:background "grey70"))
                                   (((type graphic)) (:overline "#aaa":foreground "#303030"))))
 '(mode-line-inactive             ((((type tty)) (:background "grey80"))
                                   (((type graphic)) (:overline "#aaa" :foreground "#757575"))))
 `(parenthesis                    ((t (:foreground "#909090"))))
 '(highlight-symbol-face          ((t ())))
 '(yascroll:thumb-fringe          ((t (:background "#606060" :foreground "#606060"))))
 '(yascroll:thumb-text-area       ((t (:background "#606060" :foreground "#606060"))))
 '(rime-indicator-face            ((t (:foreground "#1853cc"))))
 '(rime-indicator-dim-face        ((t ())))
 '(rime-default-face              ((t (:foreground "#303030" :background "#ececec"))))
 '(rime-preedit-face              ((t (:inverse-video nil :underline t))))
 '(rime-cursor-face               ((t (:inherit font-lock-constant-face))))
 '(rime-candidate-num-face        ((t ())))
 '(rime-comment-face              ((t ())))
 '(rime-indicator-face            ((t (:foreground "#713da6"))))
 '(telega-entity-type-code        ((t (:inherit fixed-pitch))))
 '(telega-entity-type-pre         ((t (:inherit fixed-pitch))))
 '(cider-fringe-good-face         ((t (:foreground "#006666"))))
 '(web-mode-html-attr-name-face   ((t ())))
 '(web-mode-html-tag-face         ((t ())))
 `(line-number-current-line       ((((type graphic))
                                    :inherit default
                                    :background "#eeeeee"
                                    :overline "#9999cc"
                                    :underline "#9999cc"
                                    :bold t)
                                   (t (:bold t :inherit default :background "#ffffff"))))
 '(mc/cursor-bar-face             ((t (:background "grey50" :height 1))))
 '(dired-subtree-depth-1-face     ((t (:background "grey90"))))
 '(dired-subtree-depth-2-face     ((t (:background "grey80"))))
 '(dired-subtree-depth-3-face     ((t (:background "grey70"))))
 '(dired-subtree-depth-4-face     ((t (:background "grey90"))))
 '(dired-subtree-depth-5-face     ((t (:background "grey80"))))
 '(dired-subtree-depth-6-face     ((t (:background "grey70"))))
 '(web-mode-function-call-face    ((t ())))
 '(web-mode-function-name-face    ((t ())))
 '(web-mode-html-tag-face         ((t (:bold t))))
 '(web-mode-symbol-face           ((t (:inherit font-lock-constant-face))))
 '(window-divider                 ((t (:foreground "#aaa"))))
 '(vertical-border                ((t (:foreground "grey20"))))
 '(web-mode-html-tag-bracket-face ((t (:inherit parenthesis))))
 '(web-mode-doctype-face          ((t (:foreground "grey40"))))
 '(css-selector                   ((t (:inherit font-lock-constant-face))))
 '(markdown-header-face-1         ((t (:bold t :height 2.2))))
 '(markdown-header-face-2         ((t (:bold t :height 1.8))))
 '(markdown-header-face-3         ((t (:bold t :height 1.4))))
 '(markdown-header-face-4         ((t (:bold t :height 1.2))))
 '(markdown-header-face-5         ((t (:bold t :height 1.2))))
 '(markdown-header-face-6         ((t (:bold t :height 1.2))))
 '(markdown-header-face-7         ((t (:bold t :height 1.2)))))

(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'printed)
;;; printed-theme.el ends here
