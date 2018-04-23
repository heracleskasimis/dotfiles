;;; config/idk/config.el -*- lexical-binding: t; -*-

;; theme
(add-to-list 'custom-theme-load-path "~/.doom.d/themes")
(setq-default doom-theme 'yellow-light)

;; scrolling
(setq-default mouse-wheel-progressive-speed nil
              scroll-preserve-screen-position nil)

;; menu bar
(if (display-graphic-p) (menu-bar-mode 1))

;; magit
(defun +magit/quit () (interactive) (magit-mode-bury-buffer t))

;; org-mode
(defadvice org-babel-execute-src-block (around load-language nil activate)
  "Load language if needed"
  (let ((language (org-element-property :language (org-element-at-point))))
    (unless (cdr (assoc (intern language) org-babel-load-languages))
      (add-to-list 'org-babel-load-languages (cons (intern language) t))
      (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages))
    ad-do-it))
