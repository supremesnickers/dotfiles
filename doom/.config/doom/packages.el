;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! ivy-rich)

(package! kaolin-themes)
(package! rainbow-mode)
;; (package! pretty-mode)

(package! info-colors :pin "47ee73cc19b1049eef32c9f3e264ea7ef2aaf8a5")

(package! doct)
(package! org-drill)
(package! org-fragtog)
(package! org-super-agenda)
;; (package! ox-reveal)
(package! ox-hugo)

(package! aas)
(package! laas)

(package! htmlize)
(package! web-beautify)

(package! lorem-ipsum)
(package! auctex)
(package! pdf-tools)
;; (package! emms)
(package! dired-subtree)
(package! mu4e-alert)

(package! esup)
(package! elisp-autofmt :recipe (:host gitlab :repo "ideasman42/emacs-elisp-autofmt"))
(package! yaml.el :recipe (:host github :repo "zkry/yaml.el"))
