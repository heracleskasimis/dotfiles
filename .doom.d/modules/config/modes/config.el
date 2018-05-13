;;; config/modes/config.el -*- lexical-binding: t; -*-

;; neo-tree
(setq-default neo-window-fixed-size nil)

;; flycheck
(setq flycheck-check-syntax-automatically '(mode-enabled save))

;; line wrap
(add-hook 'visual-line-mode-hook #'adaptive-wrap-prefix-mode)
; (global-visual-line-mode +1)

;; which key
(setq-default which-key-idle-delay 0.25)
(setq-default which-key-idle-secondary-delay 0)

;; magit
(with-eval-after-load 'magit
  (define-key magit-mode-map (kbd doom-leader-key) nil)
  (define-key magit-diff-mode-map (kbd doom-leader-key) nil))

;; scrolling
(setq-default mouse-wheel-progressive-speed nil
              scroll-preserve-screen-position nil)

;; org-mode
(defadvice org-babel-execute-src-block (around load-language nil activate)
  "Load language if needed"
  (let ((language (org-element-property :language (org-element-at-point))))
    (unless (cdr (assoc (intern language) org-babel-load-languages))
      (add-to-list 'org-babel-load-languages (cons (intern language) t))
      (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages))
    ad-do-it))

;; rjsx
(with-eval-after-load 'rjsx-mode
  (define-key rjsx-mode-map "<" nil)
  (define-key rjsx-mode-map (kbd "C-d") nil)
  (define-key rjsx-mode-map ">" nil))
