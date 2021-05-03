;; [[file:../../../../var/folders/t8/qm3r3h2s09112x5j_56_tsd80000gn/T/config.org.fXQo3h::*Org mode][Org mode:3]]
;; change latex export to use latexmk
(setq org-latex-pdf-process '("latexmk -f -pdf -%latex -shell-escape -interaction=nonstopmode -output-directory=%o %f"))

;; ;; add language support in latex export
;; (add-to-list 'org-latex-packages-alist
;;              '("AUTO" "babel" t ("pdflatex")))
;; (add-to-list 'org-latex-packages-alist
;;              '("AUTO" "polyglossia" t ("xelatex" "lualatex")))
;; Org mode:3 ends here
