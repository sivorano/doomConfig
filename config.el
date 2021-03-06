;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Anders Samsø Birch"
      user-mail-address "anders.s.birch1@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
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
;fter! org
;  (setq org-startup-indented nil))
;
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(add-hook! elixir-mode
           (rainbow-delimiters-mode))

(global-xah-math-input-mode)


(menu-bar-mode)

(setq evil-normal-state-cursor '(box "red")
      evil-insert-state-cursor '(bar "medium sea green")
      evil-visual-state-cursor '(hollow "orange"))

(setq evil-move-cursor-back nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (sh . t)
   (elixir . t)
   (org . t)
   (ditaa . t)
   (clojure . t)))
;(after! org
 ; (setq org-startup-indented nil))





(defhydra my/navigator  (:color pink
                    :hint nil
                    :body-pre (when (not (use-region-p)) (push-mark)))
  "Navigator"
  ("æ" nil "cancel" :color blue)

  ("e" #'backward-kill-word "delete word backward")
  ("r" #'kill-word "delte word forward")

  ("u" #'left-word "left-word")
  ("o" #'right-word "right-word")

  ("j" #'left-char "left")
  ("k" #'next-line "down")
  ("i" #'previous-line "up")
  ("l" #'right-char "right"))





(map! :desc "Activate iEdit Mode"
      "<f11>" #'iedit-mode)

(map! :desc "Helm Occur"
      "<f12>" #'helm-occur)

(map! :desc "test"
      :n "æ" #'my/navigator/body)

(map! :desc "Avy goto word"
      :n "ø" #'avy-goto-word-1)

(map! :mode elixir-mode
      "<f5>" #'exunit-verify-all)




; parenthesis


(map! :leader
      :desc "Slurp forwards"
      "a o" #'paredit-forward-slurp-sexp)

(map! :leader
      :desc "Slurp backwards"
      "a u" #'paredit-backward-slurp-sexp)

(map! :leader
      :desc "Barf backwards"
      "a e" #'paredit-backward-barf-sexp)

(map! :leader
      :desc "Barf forwards"
      "a r" #'paredit-forward-barf-sexp)



; rainbow



; Caps to home
;
(if (file-exists-p "~/.Xmodmap")
    (progn
        (shell-command "xmodmap ~/.Xmodmap")
        (map! "<home>" #'evil-normal-state)))






(add-hook 'after-init-hook 'global-color-identifiers-mode)
