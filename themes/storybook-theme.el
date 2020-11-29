;;; -*- lexical-binding: t -*-

(deftheme storybook "A simple medium contrast light theme.")

(custom-theme-set-faces
 'storybook
 `(default                        ((((type tty))
								    :background "#f8f8f8")
                                   (((type graphic))
                                    :background "#fcf7e8"
                                    :foreground "#331c09")))
 `(hl-line                        ((((type graphic))
                                    :box (:line-width (-1 . -2) :color "#edccb7" :style nil))
                                   (((type tty))
                                    :background "#ffffff")))
 `(cursor                         ((t (:background "black"))))
 '(region                         ((t (:background "#edccb7"))))
 `(font-lock-comment-face         ((t (:background "#e1f0e5" :extend t))))
 `(font-lock-doc-face             ((t (:background "#e1f0e5" :extend t))))
 `(font-lock-warning-face         ((t (:foreground "red"))))
 `(font-lock-string-face          ((t (:background "#faece1"))))
 `(font-lock-function-name-face   ((t (:background "#e9defa"))))
 `(font-lock-keyword-face         ((t (:foreground "#0a3a45"))))
 `(font-lock-constant-face        ((t (:foreground "#381a8a"))))
 `(font-lock-builtin-face         ((t ())))
 `(font-lock-variable-name-face   ((t ())))
 `(font-lock-type-face            ((t ())))
 `(font-lock-preprocessor-face    ((t (:inherit font-lock-constant-face))))
 '(meow-keypad-indicator          ((t (:foreground "#801717" :background "#FF6666"))))
 '(meow-insert-indicator          ((t (:foreground "#309030" :background "#AAE9A0"))))
 '(meow-normal-indicator          ((t (:foreground "#6F5033" :background "#FFEE99"))))
 '(meow-motion-indicator          ((t (:foreground "#505090" :background "#AACCEE"))))
 '(meow-keypad-cursor             ((t (:background "black"))))
 '(meow-insert-cursor             ((t (:background "black"))))
 '(meow-normal-cursor             ((t (:background "black"))))
 '(meow-motion-cursor             ((t (:background "black"))))
 '(dired-directory                ((t (:bold t))))
 '(mode-line                      ((((type tty))
                                    (:background "grey70"))
                                   (((type graphic))
                                    (:box (:line-width (-1 . -1) :color "#a8a296")
                                          :background "#ede4d1"))))
 '(mode-line-inactive             ((((type tty))
                                    (:background "grey80"))
                                   (((type graphic))
                                    (:box (:line-width (-1 . -1) :color "#a8a296") :background "#e0d8c5"))))
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
                                    :inherit hl-line)
                                   (t (:bold t :inherit default :background "#ffffff"))))
 '(mc/cursor-bar-face             ((t (:background "grey50" :height 1))))
 '(dired-subtree-depth-1-face     ((t (:background "grey90"))))
 '(dired-subtree-depth-2-face     ((t (:background "grey80"))))
 '(dired-subtree-depth-3-face     ((t (:background "grey70"))))
 '(dired-subtree-depth-4-face     ((t (:background "grey90"))))
 '(dired-subtree-depth-5-face     ((t (:background "grey80"))))
 '(dired-subtree-depth-6-face     ((t (:background "grey70"))))
 `(ivy-current-match              ((t (:background "#EAC5A0"))))
 `(ivy-minibuffer-match-highlight ((t (:foreground "#00D7D7"))))
 `(ivy-minibuffer-match-face-1    ((t ())))
 `(ivy-minibuffer-match-face-2    ((t ())))
 `(ivy-minibuffer-match-face-3    ((t ())))
 `(ivy-minibuffer-match-face-4    ((t ())))
 '(minibuffer-prompt              ((t (:foreground "#0a3a45"))))
 '(web-mode-function-call-face    ((t ())))
 '(web-mode-function-name-face    ((t ())))
 '(web-mode-html-tag-face         ((t (:bold t))))
 '(window-divider                 ((t (:foreground "grey60"))))
 '(vertical-border                ((t (:foreground "grey20"))))
 '(web-mode-html-tag-bracket-face ((t (:inherit parenthesis))))
 '(web-mode-doctype-face          ((t (:foreground "grey40")))))

(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'storybook)
;;; storybook-theme.el ends here
