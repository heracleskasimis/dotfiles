;;; lang/javascript-extras/config.el -*- lexical-binding: t; -*-

(require 'prettier-js)

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
