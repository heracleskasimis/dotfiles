;;; lang/javascript-extras/config.el -*- lexical-binding: t; -*-

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
