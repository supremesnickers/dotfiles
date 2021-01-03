;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;;
;;       _/                                                          _/
;;      _/_/_/      _/_/      _/_/_/  _/_/_/      _/_/_/    _/_/    _/    _/_/
;;     _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/  _/    _/
;;    _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/  _/    _/
;;   _/    _/    _/_/      _/_/_/  _/    _/    _/_/_/    _/_/    _/    _/_/
;;                                                _/
;;                                           _/_/

;; (add-to-list 'load-path "/usr/local/Cellar/mu/1.4.13/share/emacs/site-lisp/mu/mu4e")

(setq load-path (cons "~/.config/doom" load-path))
(load "org-config")
(load "hydra")

;; favorite light theme
;; (setq doom-theme 'zaiste)

;; favorite dark theme
(setq doom-theme 'doom-tomorrow-night)
(after! doom-theme
  (setq kaolin-themes-bold t        ; If nil, disable the bold style.
        kaolin-themes-italic t      ; If nil, disable the italic style.
        kaolin-themes-underline t ; If nil, disable the underline style.
        kaolin-themes-italic-comments t
        kaolin-themes-hl-line-colored t
        kaolin-themes-distinct-company-scrollbar t
        kaolin-themes-git-gutter-solid t))

;; ;; startup banner
;; (setq +doom-dashboard-banner-dir "~/.config/doom/banners/")
;; (setq +doom-dashboard-banner-file "logo.png")

;; fonts

;; (setq doom-font (font-spec :family "Fira Mono" :size 14 :weight 'medium)
;;       doom-big-font (font-spec :family "Fira Mono" :size 20 :weight 'medium)
;;       doom-variable-pitch-font (font-spec :family "Avenir" :size 14 :weight 'regular)
;;       doom-unicode-font (font-spec :family "FontAwesome" :size 14 :weight 'regular))

(setq doom-font (font-spec :family "JetBrainsMonoMedium Nerd Font Mono" :size 17 :weight 'medium)
      doom-big-font (font-spec :family "JetBrainsMonoMedium Nerd Font Mono" :size 22 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "sans" :size 14 :weight 'regular)
      doom-unicode-font (font-spec :family "FontAwesome" :size 14 :weight 'regular))

;; (setq doom-font (font-spec :family "Iosevka Nerd Font" :size 15 :weight 'medium)
;;       doom-big-font (font-spec :family "Iosevka Nerd Font" :size 22 :weight 'medium)
;;       doom-variable-pitch-font (font-spec :family "Avenir" :size 14 :weight 'regular)
;;       doom-unicode-font (font-spec :family "FontAwesome" :size 14 :weight 'regular))

(setq doom-themes-treemacs-enable-variable-pitch nil)

;; bigger characters when selecting windows with avy
(custom-set-faces!
  '(aw-leading-char-face
    :foreground "white" :background "red"
    :weight bold :height 2.5 :box (:line-width 10 :color "red")))

;; modeline
(setq all-the-icons-scale-factor 1.1)
(setq doom-modeline-icon (display-graphic-p)
      doom-modeline-buffer-encoding nil
      doom-modeline-modal-icon t
      doom-modeline-height 30
      doom-modeline-major-mode-icon t
      doom-modeline-major-mode-color-icon nil
      doom-modeline-buffer-file-name-style 'truncate-upto-project
      doom-modeline-bar-width 3
      doom-modeline-irc t
      doom-modeline-mu4e t
      doom-modeline-enable-word-count nil)

;; (mu4e-alert-enable-mode-line-display)

(setq display-time-format "%a %e. %b %H:%M")
(setq display-time-default-load-average nil)
(display-time-mode 1)                             ; Enable time in the mode-line

(doom-modeline-def-modeline 'my-simple-line
  '(matches buffer-info remote-host buffer-position selection-info)
  '(misc-info minor-modes input-method buffer-encoding mu4e major-mode process vcs checker))

;; Add to `doom-modeline-mode-hook` or other hooks
(defun setup-custom-doom-modeline ()
   (doom-modeline-set-modeline 'my-simple-line 'default))

(add-hook 'doom-modeline-mode-hook 'setup-custom-doom-modeline)

(nav-flash-show)
(setq-default
    delete-by-moving-to-trash t                      ; Delete files to trash
    tab-width 4                                      ; Set width for tabs
    uniquify-buffer-name-style 'forward              ; Uniquify buffer names
    window-combination-resize t                      ; take new window space from all other windows (not just current)
    x-stretch-cursor t)                              ; Stretch cursor to the glyph width


(when IS-MAC
  (progn
    (setq mac-command-modifier 'meta)
    (setq doom-leader-alt-key "S-SPC"))
  )

;; credentials
(setq user-full-name "Hoang Seidel"
      user-mail-address "hoangseidel02@gmail.com")

;; mu4e

(setq mu4e-html2text-command
  "textutil -stdin -format html -convert txt -stdout")

(map! :leader
      ;; :n "SPC" #'counsel-M-x
      :n ";"   #'pp-eval-expression)
(set-register ?o (cons 'file "~/org/index.org"))

;; GENERAL EDITOR
(setq display-line-numbers-type t)

;; (setq highlight-indent-guides-mode 'character)
;; (setq highlight-indent-guides-character ?|)
;; (setq highlight-indent-guides-delay 0.5)
;; (setq highlight-indent-guides-auto-character-face-perc 20)

;; Escape Insert mode with jk
;; (setq-default evil-escape-key-sequence "jk")
;; (setq evil-shift-width 4)
;; (after! evil
;;   (setq evil-echo-state nil)
;;   (setq evil-split-window-below t
;;           evil-vsplit-window-right t))
;; (global-undo-tree-mode -1)

;; ;; DIRED
;; (after! dired
;;   (map! :n "-" #'dired-jump))

;; (after! dired
;;   (add-hook 'dired-mode-hook #'dired-hide-details-mode))

;; (after! dired
;;   (setq dired-subtree-use-backgrounds nil))

;; (after! dired
;;   (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
;;   (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))

;; DIRED
(after! dired
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map)
  (map! :n "-" #'dired-jump)
  (setq dired-subtree-use-backgrounds nil)
  (add-hook 'dired-mode-hook #'dired-hide-details-mode))

(nav-flash-show)

;; pretty code
;; (remove-hook! 'text-mode-hook #'display-line-numbers-mode)
;; (add-hook! 'text-mode-hook :append (setq-local display-line-numbers nil))
;; (add-hook 'TeX-mode-hook (lambda () (prettify-symbols-mode)))
(setq global-prettify-symbols-mode nil)
(remove-hook! 'c-mode 'prettify-symbols-mode)

;; latex
(latex-preview-pane-enable)
(require 'tex)
(TeX-global-PDF-mode t)

;; PDF
(pdf-tools-install)
;; (require 'pdf-view-mode)
(setq-default pdf-view-display-size 'fit-page)
(bind-keys :map pdf-view-mode-map
    ("\\" . hydra-pdftools/body)
    ("<s-spc>" .  pdf-view-scroll-down-or-next-page)
    ("g"  . pdf-view-first-page)
    ("G"  . pdf-view-last-page)
    ("l"  . image-forward-hscroll)
    ("h"  . image-backward-hscroll)
    ("j"  . pdf-view-next-page)
    ("k"  . pdf-view-previous-page)
    ("e"  . pdf-view-goto-page)
    ("u"  . pdf-view-revert-buffer)
    ("al" . pdf-annot-list-annotations)
    ("ad" . pdf-annot-delete)
    ("aa" . pdf-annot-attachment-dired)
    ("am" . pdf-annot-add-markup-annotation)
    ("at" . pdf-annot-add-text-annotation)
    ("y"  . pdf-view-kill-ring-save)
    ("i"  . pdf-misc-display-metadata)
    ("s"  . pdf-occur)
    ("b"  . pdf-view-set-slice-from-bounding-box)
    ("r"  . pdf-view-reset-slice))

;; ;; yasnippet
;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/yasnippet")
;; (yas-global-mode 1)

;; ;; draw ivy popup in middle of screen, had issues when reloading with doom/reload
;; (setq
;;     ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center))
;;     ivy-posframe-parameters '((left-fringe . 8) (right-fringe . 8))
;;     ivy-posframe-border-width 2)

(global-set-key (kbd "C-s") 'swiper-isearch)

;; (ivy-rich-mode 1)
;; (ivy-posframe-mode 1)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))
(setq +ivy-buffer-preview t)

;; (global-pretty-mode t)
(rainbow-mode t)

;; elfeed
(setq elfeed-search-filter "@1-week-ago +unread +news ")
(map! :leader
      :prefix ("o" . "open")
      :desc "Elfeed" "e" #'elfeed)

(require 'elfeed-org)
(elfeed-org)
(require 'elfeed)

;; lorem ipsum
;; (lorem-ipsum-use-default-bindings)
(map! (:leader
        (:desc "insert lorem" :prefix "i l"
         :desc "insert lorem list"        :nv     "l" #'lorem-ipsum-insert-list
         :desc "insert lorem paragraph"   :nv     "p" #'lorem-ipsum-insert-paragraphs
         :desc "insert lorem sentence"    :nv     "o" #'lorem-ipsum-insert-sentences)))

;; open main index file
(map! :leader
      :desc "Main index" "o o" #'(lambda () (interactive) (find-file "~/org/index.org")))
;; start drill session
(map! :map org-mode-map
      :leader
      :desc "org-drill" "m D" #'org-drill)

(map! :leader
      :prefix "o"
      :desc "open calendar" "c" #'org-goto-calendar)

;; which key
;; replace all evil-* entries
(setq which-key-allow-multiple-replacements t)
(after! which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
   ))
(setq which-key-idle-delay 0.5) ;; I need the help, I really do

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/org/chemie/chemie_abi.org" "~/org/mathe/mathe_abi.org" "/home/hoangolo/org/todo.org" "/home/hoangolo/org/Physik.org" "~/org/chemie/chemie.org" "/home/hoangolo/org/2020-07-01t1449.org" "/home/hoangolo/org/Git.org" "/home/hoangolo/org/README.org" "/home/hoangolo/org/Vim.org" "/home/hoangolo/org/berechnung.org" "/home/hoangolo/org/blender.org" "/home/hoangolo/org/elfeed.org" "/home/hoangolo/org/emacs.org" "/home/hoangolo/org/englisch.org" "/home/hoangolo/org/ideas.org" "/home/hoangolo/org/index.org" "/home/hoangolo/org/jobsuche.org" "/home/hoangolo/org/journal.org" "/home/hoangolo/org/musik.org" "/home/hoangolo/org/notes.org" "/home/hoangolo/org/org-mode-tutorial.org" "/home/hoangolo/org/pandoc.org" "/home/hoangolo/org/rulesforsuccess.org" "/home/hoangolo/org/sek.org" "/home/hoangolo/org/sek_after_corona.org" "/home/hoangolo/org/tasks.org" "/home/hoangolo/org/test_export.org" "/home/hoangolo/org/tips.org" "/home/hoangolo/org/vocabulary_english.org" "/home/hoangolo/org/xmonad.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
