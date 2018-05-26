;;; cyan-dark-theme.el --- inspired by Doom One
(require 'doom-themes)

(defgroup cyan-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom cyan-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'cyan-dark-theme
  :type 'boolean)

(defcustom cyan-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'cyan-dark-theme
  :type 'boolean)

(defcustom cyan-dark-comment-bg nil
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'cyan-dark-theme
  :type 'boolean)

(defcustom cyan-dark-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'cyan-dark-theme
  :type '(or integer boolean))

(def-doom-theme cyan-dark
  "A dark theme based on doom-one"

  ;; name        default     256       16
  ((bg           '("#1c1c1c" nil       nil            ))
   (bg-alt       '("#121212" "#121212" nil            ))
   (base0        '("#000000" "#000000" "black"        ))
   (base1        '("#262626" "#262626" "brightblack"  ))
   (base2        '("#3a3a3a" "#3a3a3a" "brightblack"  ))
   (base3        '("#444444" "#444444" "brightblack"  ))
   (base4        '("#767676" "#767676" "white"        ))
   (base5        '("#808080" "#808080" "white"        ))
   (base6        '("#9e9e9e" "#9e9e9e" "white"        ))
   (base7        '("#c6c6c6" "#c6c6c6" "brightwhite"  ))
   (base8        '("#eeeeee" "#eeeeee" "brightwhite"  ))
   (fg           '("#ffffff" nil       nil            ))
   (fg-alt       '("#3a3a3a" "#3a3a3a" nil            ))

   (grey         base4)
   (red          '("#ff5faf" "#ff5faf" "red"          ))
   (orange       '("#870087" "#870087" "brightred"    ))
   (green        '("#005f5f" "#005f5f" "green"        ))
   (teal         '("#afffff" "#afffff" "brightgreen"  ))
   (yellow       '("#878700" "#878700" "yellow"       ))
   (blue         '("#00ffff" "#00ffff" "brightblue"   ))
   (dark-blue    '("#00afaf" "#00afaf" "blue"         ))
   (magenta      '("#d75fd7" "#d75fd7" "magenta"      ))
   (violet       '("#ff87ff" "#ff87ff" "brightmagenta"))
   (cyan         '("#87ffff" "#87ffff" "brightcyan"   ))
   (dark-cyan    '("#008b8b" "#008b8b" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   base0)
   (selection      cyan)
   (builtin        cyan)
   (comments       (if cyan-dark-brighter-comments cyan base4))
   (doc-comments   (doom-darken comments 0.15))
   (constants      teal)
   (functions      fg)
   (keywords       cyan)
   (methods        fg)
   (operators      yellow)
   (type           cyan)
   (strings        dark-blue)
   (variables      fg)
   (numbers        teal)
   (region         `(,(doom-darken (car bg-alt) 0.1) ,@(doom-darken (cdr base0) 0.3)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    cyan)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (-modeline-bright cyan-dark-brighter-modeline)
   (-modeline-pad
    (when cyan-dark-padded-modeline
      (if (integerp cyan-dark-padded-modeline) cyan-dark-padded-modeline 4)))

   (modeline-fg     (if -modeline-bright bg nil))
   (modeline-fg-alt (doom-blend teal base4 0.5))

   (modeline-bg (if -modeline-bright fg base0))
   (modeline-bg-l (if -modeline-bright fg base0))
   (modeline-bg-inactive (if -modeline-bright (doom-lighten fg 0.2) base0))
   (modeline-bg-inactive-l `(,(doom-darken (car base0) 0.05) ,@(cdr base0))))

  ;; --- extra faces ------------------------
  ((font-lock-comment-face
    :foreground comments
    :background (if cyan-dark-comment-bg base0))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments
    :slant 'italic)

   ((line-number &override) :foreground base4 :background nil)
   ((line-number-current-line &override) :foreground base4 :background bg)

   (solaire-default-face :background (doom-darken bg 0.4))
   (solaire-hl-line-face :inherit 'hl-line :background (doom-darken bg-alt 0.4))
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
   (magit-diff-hunk-heading :background (doom-darken base2 0.2))
   (magit-diff-hunk-heading-highlight :background base2)
   (magit-blame-heading :foreground orange :background bg-alt)
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
   (company-tooltip-selection :background cyan :foreground base0 :weight 'bold)

   ;; dired
   (dired-k-modified :foreground red)
   (dired-k-untracked :foreground grey)
   (dired-k-commited :foreground blue)

   ;; evil
   (evil-ex-lazy-highlight :background orange)

   ;; vim
   (vimrc-number :foreground strings)

   ;; highlight numbers
   (highlight-numbers-number :foreground constants)

   ;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground fg)
   (rainbow-delimiters-depth-2-face :foreground dark-blue)
   (rainbow-delimiters-depth-3-face :foreground base6)
   (rainbow-delimiters-depth-4-face :foreground blue)
   (rainbow-delimiters-depth-5-face :foreground yellow)
   (rainbow-delimiters-depth-6-face :foreground teal)
   (rainbow-delimiters-depth-7-face :foreground violet)

   ;; neo-tree
   (neo-root-dir-face
    :foreground cyan
    :background vertical-bar
    :bold bold
    :box `(:line-width 3 :color ,vertical-bar))

   ;; js2
   (js2-object-property :foreground fg)
   (js2-object-property-access :foreground fg)

   ;; nav-flash
   (nav-flash-face :background base0 :foreground teal :weight 'bold)
   )

  ;; --- extra variables ---------------------
  ;; ()
  )

;;; cyan-dark-theme.el ends here

