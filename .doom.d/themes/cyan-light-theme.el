;;; cyan-light-theme.el --- inspired by Doom One Light
(require 'doom-themes)

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

(defcustom cyan-light-comment-bg nil
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'cyan-light-theme
  :type 'boolean)

(defcustom cyan-light-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'cyan-light-theme
  :type '(or integer boolean))

(defcustom cyan-light-yellow-highlight nil
  "If non-nil, uses yellow color for lazy highlight"
  :group 'cyan-light-theme
  :type 'boolean)

;;
(def-doom-theme cyan-light
  "A light theme based on doom-one-light"

  ;; name        default     256       16
  ((bg           '("#ffffff" nil       nil            ))
   (bg-alt       '("#f5f5f5" "#f5f5f5" "brightwhite"  ))
   (base0        '("#eeeeee" "#eeeeee" "white"        ))
   (base1        '("#fcfcfc" "#fcfcfc" "brightwhite"  ))
   (base2        '("#f3f3f3" "#f3f3f3" "brightwhite"  ))
   (base3        '("#c6c6c6" "#c6c6c6" "brightwhite"  ))
   (base4        '("#9e9e9e" "#9e9e9e" "white"        ))
   (base5        '("#808080" "#808080" "white"        ))
   (base6        '("#6c6c6c" "#6c6c6c" "white"        ))
   (base7        '("#4e4e4e" "#4e4e4e" "brightblack"  ))
   (base8        '("#3a3a3a" "#3a3a3a" "brightblack"  ))
   (fg           '("#000000" nil       nil            ))
   (fg-alt       '("#bcbcbc" "#bcbcbc" "white"        ))

   (grey         base4)
   (red          '("#ff5faf" "#ff5faf" "red"          ))
   (orange       '("#ff00af" "#ff00af" "brightred"    ))
   (green        '("#5fd7d7" "#5fd7d7" "green"        ))
   (teal         '("#00afaf" "#00afaf" "brightgreen"  ))
   (yellow       '("#5f5f00" "#5f5f00" "yellow"       ))
   (light-yellow '("#ffff5f" "#ffff5f" "brightyellow" ))
   (blue         '("#008787" "#008787" "brightblue"   ))
   (dark-blue    '("#005f5f" "#005f5f" "blue"         ))
   (magenta      '("#ff87df" "#ff87df" "magenta"      ))
   (violet       '("#ffafdf" "#ffafdf" "brightmagenta"))
   (cyan         '("#87ffff" "#87ffff" "brightcyan"   ))
   (dark-cyan    '("#008b8b" "#008b8b" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken bg 0.05))
   (selection      cyan)
   (builtin        dark-blue)
   (comments       (if cyan-light-brighter-comments cyan base4))
   (doc-comments   (doom-darken comments 0.15))
   (constants      teal)
   (functions      fg)
   (keywords       dark-blue)
   (methods        fg)
   (operators      yellow)
   (type           dark-blue)
   (strings        blue)
   (variables      fg)
   (numbers        teal)
   (region         `(,(doom-darken (car bg-alt) 0.1) ,@(doom-darken (cdr base0) 0.3)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    dark-blue)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (-modeline-bright cyan-light-brighter-modeline)
   (-modeline-pad
    (when cyan-light-padded-modeline
      (if (integerp cyan-light-padded-modeline) cyan-light-padded-modeline 4)))

   (modeline-fg     (if -modeline-bright bg nil))
   (modeline-fg-alt (doom-blend teal base4 0.5))

   (modeline-bg (if -modeline-bright fg (doom-darken base2 0.1)))
   (modeline-bg-l (if -modeline-bright fg (doom-darken base2 0.2)))
   (modeline-bg-inactive (if -modeline-bright (doom-lighten fg 0.2) (doom-darken base1 0.1)))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.05) ,@(cdr base1))))

  ;; --- extra faces ------------------------
  ((font-lock-comment-face
    :foreground comments
    :background (if cyan-light-comment-bg base0))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments
    :slant 'italic)

   ((line-number &override) :foreground (doom-darken base2 0.2) :background nil)
   ((line-number-current-line &override) :background teal :foreground bg)

   (solaire-default-face :background (doom-darken bg 0.05))
   (solaire-hl-line-face :inherit 'hl-line :background (doom-darken bg 0.1))
   (solaire-minibuffer-face :background bg);

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
    :background (doom-darken base2 0.1)
    :box `(:line-width 3 :color ,(doom-darken base2 0.1)))
   (magit-diff-added             :foreground (doom-darken yellow 0.2)  :background (doom-blend yellow bg 0.1))
   (magit-diff-added-highlight   :foreground yellow                    :background (doom-blend yellow bg 0.2) :weight 'bold)
   (magit-diffstat-added         :foreground yellow)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground builtin)
   (css-selector             :foreground dark-blue)

   ;; markdown-mode
   (markdown-markup-face     :foreground base5)
   (markdown-url-face        :foreground builtin)
   (markdown-italic-face     :foreground fg :slant 'italic)
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
   (org-formula          :foreground builtin);

   ;; helm
   (helm-candidate-number :background blue :foreground bg)

   ;; which key
   (which-key-group-description-face     :foreground fg)
   (which-key-local-map-description-face :foreground fg)

   ;; web-mode
   (web-mode-current-element-highlight-face :background blue :foreground bg)

   ;; wgrep
   (wgrep-face :background base1)

   ;; ediff
   (ediff-current-diff-A        :foreground red    :background (doom-lighten red 0.8))
   (ediff-current-diff-B        :foreground yellow :background (doom-lighten yellow 0.8))
   (ediff-current-diff-C        :foreground blue   :background (doom-lighten blue 0.8))
   (ediff-current-diff-Ancestor :foreground teal   :background (doom-lighten teal 0.8))

   ;; tooltip
   (tooltip :background base1 :foreground fg)

   ;; dired
   (dired-k-modified :foreground red)
   (dired-k-untracked :foreground grey)
   (dired-k-commited :foreground blue)

   ;; evil
   (evil-ex-lazy-highlight
    :background (if cyan-light-yellow-highlight
                    light-yellow
                  (doom-lighten teal 0.85)))

   ;; vim
   (vimrc-number :foreground strings)

   ;; highlight numbers
   (highlight-numbers-number :foreground constants)

   ;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground fg)
   (rainbow-delimiters-depth-2-face :foreground dark-blue)
   (rainbow-delimiters-depth-3-face :foreground blue)
   (rainbow-delimiters-depth-4-face :foreground yellow)
   (rainbow-delimiters-depth-5-face :foreground green)
   (rainbow-delimiters-depth-6-face :foreground teal)
   (rainbow-delimiters-depth-7-face :foreground violet)

   ;; neo-tree
   (neo-root-dir-face
    :foreground dark-cyan
    :background (doom-darken bg 0.05)
    :bold bold
    :box `(:line-width 3 :color ,(doom-darken bg 0.05)))

   ;; js2 & rjsx
   (js2-object-property :foreground fg)
   (js2-object-property-access :foreground fg)
   (rjsx-tag :foreground builtin)
   (rjsx-tag-bracket-face :foreground builtin)

   ;; imenu
   (imenu-list-entry-face-3 :foreground teal)
   (imenu-list-entry-subalist-face-3 :foreground teal :underline t)
   )

  ;; --- extra variables ---------------------
  ;; ()
  )

;;; cyan-light-theme.el ends here
