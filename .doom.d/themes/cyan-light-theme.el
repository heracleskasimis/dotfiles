;;; cyan-light-theme.el --- inspired by Atom One Light
(require 'doom-themes)

;;
(defgroup cyan-light-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom cyan-light-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'cyan-light-theme
  :type 'boolean)

(defcustom cyan-light-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'cyan-light-theme
  :type 'boolean)

(defcustom cyan-light-comment-bg cyan-light-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'cyan-light-theme
  :type 'boolean)

(defcustom cyan-light-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'cyan-light-theme
  :type '(or integer boolean))

;;
(def-doom-theme cyan-light
  "A light theme based on doom-one-light"

  ;; name        default   256       16
  ((bg         '("#ffffff" nil       nil            ))
   (bg-alt     '("#f0f0f0" nil       nil            ))
   (base0      '("#f0f0f0" "#f0f0f0" "white"        ))
   (base1      '("#e7e7e7" "#e7e7e7" "brightblack"  ))
   (base2      '("#fcfcfc" "#fcfcfc" "brightblack"  ))
   (base3      '("#c4c4c4" "#c4c4c4" "brightblack"  ))
   (base4      '("#a8a8a8" "#a8a8a8" "brightblack"  ))
   (base5      '("#303030" "#303030" "brightblack"  ))
   (base6      '("#202020" "#202020" "brightblack"  ))
   (base7      '("#1e1e1e" "#1e1e1e" "brightblack"  ))
   (base8      '("#2b2b2b" "2b2b2b"   "black"        ))
   (fg         '("#303030" "#303030" "black"        ))
   (fg-alt     '("#c2c2c2" "#c2c2c2" "brightblack"  ))

   (grey       base4)
   (red        '("#ee7ae9"   "#ee7ae9" "red"          ))
   (orange     '("#ee3a8c"   "#ee3a8c" "brightred"    ))
   (green      '("#00868b"   "#00868b" "green"        ))
   (teal       '("#00cdcd"   "#00cdcd" "brightgreen"  ))
   (yellow     '("#8b864e"   "#8b864e" "yellow"       ))
   (blue       '("#00cdcd"   "#00cdcd" "brightblue"   ))
   (dark-blue  '("#5fffff"   "#5fffff" "blue"         ))
   (magenta    '("#bf3eff"   "#bf3eff" "magenta"      ))
   (violet     '("#ff83fa"   "#ff83fa" "brightmagenta"))
   (cyan       '("#00eeee"   "#00eeee" "brightcyan"   ))
   (dark-cyan  '("#008b8b"   "#008b8b" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      green)
   (vertical-bar   (doom-darken base2 0.1))
   (selection      cyan)
   (builtin        magenta)
   (comments       (if cyan-light-brighter-comments cyan base4))
   (doc-comments   (doom-darken comments 0.15))
   (constants      violet)
   (functions      magenta)
   (keywords       magenta)
   (methods        magenta)
   (operators      blue)
   (type           magenta)
   (strings        green)
   (variables      (doom-darken magenta 0.36))
   (numbers        teal)
   (region         `(,(doom-darken (car bg-alt) 0.1) ,@(doom-darken (cdr base0) 0.3)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    teal)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (-modeline-bright cyan-light-brighter-modeline)
   (-modeline-pad
    (when cyan-light-padded-modeline
      (if (integerp cyan-light-padded-modeline) cyan-light-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt (doom-blend violet base4 (if -modeline-bright 0.5 0.2)))

   (modeline-bg
    (if -modeline-bright
        (doom-darken base2 0.05)
      base1))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken base2 0.1)
      base2))
   (modeline-bg-inactive (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.05) ,@(cdr base1))))

  ;; --- extra faces ------------------------
  ((font-lock-comment-face
    :foreground comments
    :background (if cyan-light-comment-bg base0))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments
    :slant 'italic)

   ((line-number &override) :foreground (doom-darken base2 0.15))
   ((line-number-current-line &override) :foreground base8)

   (solaire-hl-line-face :inherit 'hl-line :background base0)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; magit
   (magit-blame-heading     :foreground orange :background bg-alt)
   (magit-diff-removed :foreground (doom-darken red 0.2) :background (doom-blend red bg 0.1))
   (magit-diff-removed-highlight :foreground red :background (doom-blend red bg 0.2) :bold bold)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face     :foreground base5)
   (markdown-header-face     :inherit 'bold :foreground fg)
   (markdown-code-face       :background base1)
   (mmm-default-submode-face :background base1)

   ;; org-mode
   (org-block            :background base1)
   (org-block-begin-line :foreground fg :slant 'italic)
   (org-level-1          :foreground red    :weight 'ultra-bold :height 1.2)
   (org-level-2          :foreground orange :weight 'extra-bold :height 1.1)
   (org-level-3          :foreground violet :bold bold          :height 1.1)
   (org-ellipsis         :underline nil :background bg     :foreground red)
   (org-quote            :background base1)

   ;; helm
   (helm-candidate-number :background blue :foreground bg)

   ;; web-mode
   (web-mode-current-element-highlight-face :background blue :foreground bg)

   ;; wgrep
   (wgrep-face :background base1)

   ;; ediff
   (ediff-current-diff-A        :foreground red   :background (doom-lighten red 0.8))
   (ediff-current-diff-B        :foreground green :background (doom-lighten green 0.8))
   (ediff-current-diff-C        :foreground blue  :background (doom-lighten blue 0.8))
   (ediff-current-diff-Ancestor :foreground teal  :background (doom-lighten teal 0.8))

   ;; tooltip
   (tooltip :background base1 :foreground fg)
   )

  ;; --- extra variables ---------------------
  ;; ()
  )

;;; cyan-light-theme.el ends here
