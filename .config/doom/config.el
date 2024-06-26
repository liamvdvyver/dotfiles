;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'catppuccin)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org")
(setq org-default-notes-file "~/Documents/org/refile.org")
(after! org
    (setq org-capture-templates
          '(
            ("t" "Todo" entry (file+headline "~/Documents/org/refile.org" "Tasks")
             "* TODO %?")
            ("n" "Note" entry (file+headline "~/Documents/org/refile.org" "Notes")
             "* %?")
            ("j" "Journal" entry (file+headline "~/Documents/org/refile.org" "Journal")
             "* %u %?")
            ("w" "Weight" entry (file+headline "~/Documents/org/fitness.org" "Weight")
             "* %u %?")
            ("e" "Excercise" entry (file+datetree "~/Documents/org/fitness.org" "Exercise")
             "* %?")
            ("p" "Piano lesson" entry (file+olp "~/Documents/org/music.org" "Calendar" "Piano lesson")
             "* %u %?")
            ("s" "Social" entry (file+headline "~/Documents/org/life.org" "Social")
             "* %^t %?")
        )
    )
    (setq org-agenda-todo-ignore-scheduled t)
    (setq org-agenda-skip-deadline-prewarning-if-scheduled t)
    (setq org-agenda-span 7)
)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;

(use-package! alert
    :config
    (setq alert-default-style 'libnotify)
)

(use-package! org-alert
    :config
    (setq org-alert-interval 300
          org-alert-notify-cutoff 15
          org-alert-notify-after-event-cutoff 10)
)
(org-alert-enable)

(after! org-super-agenda
    (setq org-super-agenda-header-map (make-sparse-keymap))
    (setq org-super-agenda-groups
           '(;; Each group has an implicit boolean OR operator between its selectors.
             (:name "Today"  ; Optionally specify section name
                    :time-grid t  ; Items that appear on the time grid
                    :todo "TODAY")  ; Items that have this TODO keyword
             (:name "Important"
                    :priority "A")
             (:name "Started"
                    :todo  ("STRT")
                    :order 1)
             (:priority<= "B"
                          :order 2)
             (:order-multi (3 (:name "Shopping in town"
                                     ;; Boolean AND group matches items that match all subgroups
                                     :and (:tag "shopping" :tag "@town"))
                              (:name "Food-related"
                                     ;; Multiple args given in list with implicit OR
                                     :tag ("food" "dinner"))
                              (:name "Personal"
                                     :habit t
                                     :tag "personal")
                              (:name "Space-related (non-moon-or-planet-related)"
                                     ;; Regexps match case-insensitively on the entire entry
                                     :and (:regexp ("space" "NASA")
                                                   ;; Boolean NOT also has implicit OR between selectors
                                                   :not (:regexp "moon" :tag "planet")))))
             ;; Groups supply their own section names when none are given
             (:todo "WAITING" :order 8)  ; Set order of this section
             )
    )
)
(org-super-agenda-mode)

;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
