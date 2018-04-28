;;; config/idk/config.el -*- lexical-binding: t; -*-

;; theme
(add-to-list 'custom-theme-load-path "~/.doom.d/themes")
(setq-default doom-theme 'cyan-light)
(setq-default solaire-mode-remap-modeline nil)
(add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)
(add-to-list '+doom-solaire-themes '(cyan-light . t))
(setq-default dired-k-size-colors nil
              dired-k-date-colors nil)

;; line wrap
(add-hook 'visual-line-mode-hook #'adaptive-wrap-prefix-mode)
; (global-visual-line-mode +1)

;; which key
(setq-default which-key-idle-delay 0.5)

;; scrolling
(setq-default mouse-wheel-progressive-speed nil
              scroll-preserve-screen-position nil)

;; menu bar
(if (display-graphic-p) (menu-bar-mode 1))

;; org-mode
(defadvice org-babel-execute-src-block (around load-language nil activate)
  "Load language if needed"
  (let ((language (org-element-property :language (org-element-at-point))))
    (unless (cdr (assoc (intern language) org-babel-load-languages))
      (add-to-list 'org-babel-load-languages (cons (intern language) t))
      (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages))
    ad-do-it))
