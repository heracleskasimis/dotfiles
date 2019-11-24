;;; config/themes/config.el -*- lexical-binding: t; -*-

(if (featurep! +large-font)
    (set-frame-font "LiterationMono Nerd Font Mono 13" nil t))
(if (featurep! +medium-font)
    (set-frame-font "Liberation Mono 11" nil t))
(if (featurep! +small-font)
    (set-frame-font "Liberation Mono 9" nil t))

(setq-default line-spacing 2)

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
(advice-add #'persp-load-state-from-file
            :after
            #'solaire-mode-restore-persp-mode-buffers)

(setq-default dired-k-size-colors nil
              dired-k-date-colors nil)

;; hl-line-mode
(remove-hook 'prog-mode-hook #'hl-line-mode)
(remove-hook 'text-mode-hook #'hl-line-mode)
(remove-hook 'conf-mode-hook #'hl-line-mode)

;; menu bar
(if (and (featurep! +menu) (display-graphic-p)) (menu-bar-mode 1))

;; hl-todo mode
(setq-default hl-todo-keyword-faces
  '(("HOLD" . "#5f5f00")
    ("TODO" . "#5f5f00")
    ("NEXT" . "#005f5f")
    ("THEM" . "#ff5faf")
    ("PROG" . "#005f5f")
    ("OKAY" . "#5fd7d7")
    ("DONT" . "#5f7f5f")
    ("FAIL" . "#ff00af")
    ("DONE" . "#5fd7d7")
    ("NOTE"   . "#5f5f00")
    ("KLUDGE" . "#5f5f00")
    ("HACK"   . "#5f5f00")
    ("FIXME"  . "#ff5faf")
    ("XXX"    . "#ff5faf")
    ("XXXX"   . "#ff5faf")
    ("???" . "#ff5faf")))
