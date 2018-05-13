;;; config/themes/config.el -*- lexical-binding: t; -*-

(if (featurep! +large-font)
    (set-frame-font "LiterationMono Nerd Font Mono 13" nil t))
(if (featurep! +small-font)
  (set-frame-font "Liberation Mono 9" nil t))
(if (and (not (featurep! +large-font)) (not (featurep! +small-font)))
    (set-frame-font "Liberation Mono 12"))

(add-to-list 'custom-theme-load-path "~/.doom.d/themes")
(add-to-list '+doom-solaire-themes '(cyan-light . t))
(add-to-list '+doom-solaire-themes '(cyan-dark . t))

(if (featurep! +light) (setq-default doom-theme 'cyan-light))
(if (featurep! +dark) (setq-default doom-theme 'cyan-dark))

(setq-default solaire-mode-remap-modeline nil)
(add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)
(add-hook 'magit-mode-hook #'solaire-mode)
(add-hook 'shell-mode-hook #'solaire-mode)
(add-hook 'eshell-mode-hook #'solaire-mode)
(add-hook 'term-mode-hook #'solaire-mode)
(add-hook 'which-key-init-buffer-hook #'solaire-mode)
(add-hook 'magit-refresh-popup-buffer-hook #'solaire-mode)

(setq-default dired-k-size-colors nil
              dired-k-date-colors nil)

;; menu bar
(if (and (featurep! +menu) (display-graphic-p)) (menu-bar-mode 1))
