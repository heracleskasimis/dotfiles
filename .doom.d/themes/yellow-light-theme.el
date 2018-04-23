;;; yellow-light-theme.el --- inspired by Atom One Light
(require 'doom-themes)

;;
(defgroup yellow-light-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom yellow-light-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'yellow-light-theme
  :type 'boolean)

(defcustom yellow-light-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'yellow-light-theme
  :type 'boolean)

(defcustom yellow-light-comment-bg nil
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'yellow-light-theme
  :type 'boolean)

(defcustom yellow-light-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'yellow-light-theme
  :type '(or integer boolean))

(defcustom yellow-light-yellow-highlight nil
  "If non-nil, uses yellow color for lazy highlight"
  :group 'yellow-light-theme
  :type 'boolean)

;;
(def-doom-theme yellow-light
  "A light theme based on doom-one-light"

  ;; name        default   256       16
  ((bg           '("#ffffff" nil       nil            ))
   (bg-alt       '("#f5f5f5" nil       nil            ))
   (base0        '("#fcfcfc" "#fcfcfc" "white"        ))
   (base1        '("#fafafa" "#fafafa" "brightwhite"  ))
   (base2        '("#f7f7f7" "#f7f7f7" "brightwhite"  ))
   (base3        '("#c6c6c6" "#c6c6c6" "brightwhite"  ))
   (base4        '("#a8a8a8" "#a8a8a8" "brightblack"  ))
   (base5        '("#3a3a3a" "#3a3a3a" "brightblack"  ))
   (base6        '("#262626" "#262626" "brightblack"  ))
   (base7        '("#1c1c1c" "#1c1c1c" "black"        ))
   (base8        '("#87875f" "#87875f" "brightblack"  ))
   (fg           '("#262626" "#262626" "black"        ))
   (fg-alt       '("#bcbcbc" "#bcbcbc" "white"        ))

   (grey         base4)
   (red          '("#ff5faf"   "#ff5faf" "red"          ))
   (orange       '("#ff00af"   "#ff00af" "brightred"    ))
   (green        '("#5f5f00"   "#5f5f00" "green"        ))
   (teal         '("#dfdf00"   "#dfdf00" "brightgreen"  ))
   (yellow       '("#8b864e"   "#8b864e" "yellow"       ))
   (light-yellow '("#ffff5f"   "#ffff5f" "brightyellow" ))
   (blue         '("#afaf5f"   "#afaf5f" "brightblue"   ))
   (dark-blue    '("#87875f"   "#87875f" "blue"         ))
   (magenta      '("#ff87df"   "#ff87df" "magenta"      ))
   (violet       '("#ff87ff"   "#ff87ff" "brightmagenta"))
   (cyan         '("#ffff00"   "#ffff00" "brightcyan"   ))
   (dark-cyan    '("#ffdf00"   "#ffdf00" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      dark-blue)
   (vertical-bar   (doom-darken base2 0.1))
   (selection      cyan)
   (builtin        magenta)
   (comments       (if yellow-light-brighter-comments cyan base4))
   (doc-comments   (doom-darken comments 0.15))
   (constants      violet)
   (functions      fg)
   (keywords       magenta)
   (methods        fg)
   (operators      yellow)
   (type           magenta)
   (strings        blue)
   (variables      fg)
   (numbers        violet)
   (region         `(,(doom-darken (car bg-alt) 0.1) ,@(doom-darken (cdr base0) 0.3)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    teal)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (-modeline-bright yellow-light-brighter-modeline)
   (-modeline-pad
    (when yellow-light-padded-modeline
      (if (integerp yellow-light-padded-modeline) cyan-light-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt (doom-blend violet base4 (if (not -modeline-bright) 0.5 0.2)))

   (modeline-bg
    (if (not -modeline-bright)
        (doom-darken base2 0.1)
      base1))
   (modeline-bg-l
    (if (not -modeline-bright)
        (doom-darken base2 0.2)
      base2))
   (modeline-bg-inactive (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.05) ,@(cdr base1))))

  ;; --- extra faces ------------------------
  ((font-lock-comment-face
    :foreground comments
    :background (if yellow-light-comment-bg base0))
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
   (magit-diff-hunk-heading :background (doom-lighten base3 0.2))
   (magit-diff-hunk-heading-highlight :background base3)
   (magit-blame-heading     :foreground orange :background bg-alt)
   (magit-diff-removed :foreground (doom-darken red 0.2) :background (doom-blend red bg 0.1))
   (magit-diff-removed-highlight :foreground red :background (doom-blend red bg 0.2) :bold bold)
   (magit-header-line
    :foreground fg
    :bold 'bold
    :background base0
    :box `(:line-width 3 :color ,base0))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face     :foreground base5)
   (markdown-list-face       :foreground fg)
   (markdown-header-face     :inherit 'bold :foreground fg)
   (markdown-code-face       :background base1)
   (markdown-header-face-1   :weight 'ultra-bold :height 1.2)
   (markdown-header-face-2   :weight 'extra-bold :height 1.1)
   (markdown-header-face-3   :bold bold          :height 1.1)
   (mmm-default-submode-face :background base1)

   ;; org-mode
   (org-block            :background base1)
   (org-block-begin-line :foreground fg :slant 'italic)
   (org-level-1          :weight 'ultra-bold :height 1.2)
   (org-level-2          :weight 'extra-bold :height 1.1)
   (org-level-3          :bold bold          :height 1.1)
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

   ;; dired
   (dired-k-modified :foreground red)
   (dired-k-untracked :foreground magenta)
   (dired-k-commited :foreground blue)

   ;; evil
   (evil-ex-lazy-highlight
    :background (if yellow-light-yellow-highlight
                    light-yellow
                  (doom-lighten teal 0.75)))

    ;; highlight numbers
    (highlight-numbers-number :foreground constants)
    )

  ;; --- extra variables ---------------------
  ;; ()
  )

;;; yellow-light-theme.el ends here
