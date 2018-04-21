;;; config/idk/config.el -*- lexical-binding: t; -*-

;; theme
(add-to-list 'custom-theme-load-path "~/.doom.d/themes")
(setq-default doom-theme 'cyan-light)

;; scrolling
(setq-default mouse-wheel-progressive-speed nil
              scroll-preserve-screen-position nil)

;; menu bar
(if (display-graphic-p) (menu-bar-mode 1))

