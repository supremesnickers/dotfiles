(use-package! doct
  :commands (doct))

(after! org-capture
  ;; <<prettify-capture>>
  (setq +org-capture-uni-units (split-string (f-read-text "~/org/uni-units.org")))
  ;; (setq +org-capture-recipies  "~/Desktop/TEC/Organisation/recipies.org")

  (defun +doct-icon-declaration-to-icon (declaration)
    "Convert :icon declaration to icon"
    (let ((name (pop declaration))
          (set  (intern (concat "all-the-icons-" (plist-get declaration :set))))
          (face (intern (concat "all-the-icons-" (plist-get declaration :color))))
          (v-adjust (or (plist-get declaration :v-adjust) 0.01)))
      (apply set `(,name :face ,face :v-adjust ,v-adjust))))

  (defun +doct-iconify-capture-templates (groups)
    "Add declaration's :icon to each template group in GROUPS."
    (let ((templates (doct-flatten-lists-in groups)))
      (setq doct-templates (mapcar (lambda (template)
                                     (when-let* ((props (nthcdr (if (= (length template) 4) 2 5) template))
                                                 (spec (plist-get (plist-get props :doct) :icon)))
                                       (setf (nth 1 template) (concat (+doct-icon-declaration-to-icon spec)
                                                                      "\t"
                                                                      (nth 1 template))))
                                     template)
                                   templates))))

  (setq doct-after-conversion-functions '(+doct-iconify-capture-templates))

  (add-transient-hook! 'org-capture-select-template
    (setq org-capture-templates
          (doct `(("Personal todo" :keys "t"
                   :icon ("checklist" :set "octicon" :color "green")
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Inbox"
                   :type entry
                   :template ("* TODO %?"
                              "%i %a")
                   )
                  ("Personal note" :keys "n"
                   :icon ("sticky-note-o" :set "faicon" :color "green")
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Inbox"
                   :type entry
                   :template ("* %?"
                              "%i %a")
                   )
                  ;; ("University" :keys "u"
                  ;;  :icon ("graduation-cap" :set "faicon" :color "purple")
                  ;;  :file +org-capture-todo-file
                  ;;  :headline "University"
                  ;;  :unit-prompt ,(format "%%^{Unit|%s}" (string-join +org-capture-uni-units "|"))
                  ;;  :prepend t
                  ;;  :type entry
                  ;;  :children (("Test" :keys "t"
                  ;;              :icon ("timer" :set "material" :color "red")
                  ;;              :template ("* TODO [#C] %{unit-prompt} %? :uni:tests:"
                  ;;                         "SCHEDULED: %^{Test date:}T"
                  ;;                         "%i %a"))
                  ;;             ("Assignment" :keys "a"
                  ;;              :icon ("library_books" :set "material" :color "orange")
                  ;;              :template ("* TODO [#B] %{unit-prompt} %? :uni:assignments:"
                  ;;                         "DEADLINE: %^{Due date:}T"
                  ;;                         "%i %a"))
                  ;;             ("Lecture" :keys "l"
                  ;;              :icon ("keynote" :set "fileicon" :color "orange")
                  ;;              :template ("* TODO [#C] %{unit-prompt} %? :uni:lecture:"
                  ;;                         "%i %a"))
                  ;;             ("Miscellaneous task" :keys "u"
                  ;;              :icon ("list" :set "faicon" :color "yellow")
                  ;;              :template ("* TODO [#D] %{unit-prompt} %? :uni:"
                  ;;                         "%i %a"))))
                  ;; ("Email" :keys "e"
                  ;;  :icon ("envelope" :set "faicon" :color "blue")
                  ;;  :file +org-capture-todo-file
                  ;;  :prepend t
                  ;;  :headline "Inbox"
                  ;;  :type entry
                  ;;  :template ("* TODO %^{type|reply to|contact} %\\3 %? :email:"
                  ;;             "Send an email %^{urgency|soon|ASAP|anon|at some point|eventually} to %^{recipiant}"
                  ;;             "about %^{topic}"
                  ;;             "%U %i %a"))
                  ("Interesting" :keys "i"
                   :icon ("eye" :set "faicon" :color "lcyan")
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Interesting"
                   :type entry
                   :template ("* [ ] %{desc}%? :%{i-type}:"
                              "%i %a")
                   :children (("Webpage" :keys "w"
                               :icon ("globe" :set "faicon" :color "green")
                               :desc "%(org-cliplink-capture) "
                               :i-type "read:web"
                               )
                              ("Article" :keys "a"
                               :icon ("file-text" :set "octicon" :color "yellow")
                               :desc ""
                               :i-type "read:reaserch"
                               )
                              ;; ("\tRecipie" :keys "r"
                              ;;  :icon ("spoon" :set "faicon" :color "dorange")
                              ;;  :file +org-capture-recipies
                              ;;  :headline "Unsorted"
                              ;;  :template "%(org-chef-get-recipe-from-url)"
                              ;;  )
                              ("Information" :keys "i"
                               :icon ("info-circle" :set "faicon" :color "blue")
                               :desc ""
                               :i-type "read:info"
                               )
                              ("Idea" :keys "I"
                               :icon ("bubble_chart" :set "material" :color "silver")
                               :desc ""
                               :i-type "idea"
                               )))
                  ("Tasks" :keys "k"
                   :icon ("inbox" :set "octicon" :color "yellow")
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Tasks"
                   :type entry
                   :template ("* TODO %? %^G%{extra}"
                              "%i %a")
                   :children (("General Task" :keys "k"
                               :icon ("inbox" :set "octicon" :color "yellow")
                               :extra ""
                               )
                              ("Task with deadline" :keys "d"
                               :icon ("timer" :set "material" :color "orange" :v-adjust -0.1)
                               :extra "\nDEADLINE: %^{Deadline:}t"
                               )
                              ("Scheduled Task" :keys "s"
                               :icon ("calendar" :set "octicon" :color "orange")
                               :extra "\nSCHEDULED: %^{Start time:}t"
                               )
                              ))
                ("Project" :keys "p"
                 :icon ("repo" :set "octicon" :color "silver")
                   :prepend t
                   :type entry
                   :headline "Inbox"
                   :template ("* %{time-or-todo} %?"
                              "%i"
                              "%a")
                   :file ""
                   :custom (:time-or-todo "")
                   :children (("Project-local todo" :keys "t"
                               :icon ("checklist" :set "octicon" :color "green")
                               :time-or-todo "TODO"
                               :file +org-capture-project-todo-file)
                              ("Project-local note" :keys "n"
                               :icon ("sticky-note" :set "faicon" :color "yellow")
                               :time-or-todo "%U"
                               :file +org-capture-project-notes-file)
                              ("Project-local changelog" :keys "c"
                               :icon ("list" :set "faicon" :color "blue")
                               :time-or-todo "%U"
                               :heading "Unreleased"
                               :file +org-capture-project-changelog-file))
                   )
                  ("\tCentralised project templates"
                   :keys "o"
                   :type entry
                   :prepend t
                   :template ("* %{time-or-todo} %?"
                              "%i"
                              "%a")
                   :children (("Project todo"
                               :keys "t"
                               :prepend nil
                               :time-or-todo "TODO"
                               :heading "Tasks"
                               :file +org-capture-central-project-todo-file)
                              ("Project note"
                               :keys "n"
                               :time-or-todo "%U"
                               :heading "Notes"
                               :file +org-capture-central-project-notes-file)
                              ("Project changelog"
                               :keys "c"
                               :time-or-todo "%U"
                               :heading "Unreleased"
                               :file +org-capture-central-project-changelog-file))
                   ))))))

;; make org capture dialog prettier
(defun org-capture-select-template-prettier (&optional keys)
  "Select a capture template, in a prettier way than default
Lisp programs can force the template by setting KEYS to a string."
  (let ((org-capture-templates
         (or (org-contextualize-keys
              (org-capture-upgrade-templates org-capture-templates)
              org-capture-templates-contexts)
             '(("t" "Task" entry (file+headline "" "Tasks")
                "* TODO %?\n  %u\n  %a")))))
    (if keys
        (or (assoc keys org-capture-templates)
            (error "No capture template referred to by \"%s\" keys" keys))
      (org-mks org-capture-templates
               "Select a capture template\n━━━━━━━━━━━━━━━━━━━━━━━━━"
               "Template key: "
               `(("q" ,(concat (all-the-icons-octicon "stop" :face 'all-the-icons-red :v-adjust 0.01) "\tAbort")))))))
(advice-add 'org-capture-select-template :override #'org-capture-select-template-prettier)

(defun org-mks-pretty (table title &optional prompt specials)
  "Select a member of an alist with multiple keys. Prettified.

TABLE is the alist which should contain entries where the car is a string.
There should be two types of entries.

1. prefix descriptions like (\"a\" \"Description\")
   This indicates that `a' is a prefix key for multi-letter selection, and
   that there are entries following with keys like \"ab\", \"ax\"…

2. Select-able members must have more than two elements, with the first
   being the string of keys that lead to selecting it, and the second a
   short description string of the item.

The command will then make a temporary buffer listing all entries
that can be selected with a single key, and all the single key
prefixes.  When you press the key for a single-letter entry, it is selected.
When you press a prefix key, the commands (and maybe further prefixes)
under this key will be shown and offered for selection.

TITLE will be placed over the selection in the temporary buffer,
PROMPT will be used when prompting for a key.  SPECIALS is an
alist with (\"key\" \"description\") entries.  When one of these
is selected, only the bare key is returned."
  (save-window-excursion
    (let ((inhibit-quit t)
    (buffer (org-switch-to-buffer-other-window "*Org Select*"))
    (prompt (or prompt "Select: "))
    case-fold-search
    current)
      (unwind-protect
    (catch 'exit
      (while t
        (setq-local evil-normal-state-cursor (list nil))
        (erase-buffer)
        (insert title "\n\n")
        (let ((des-keys nil)
        (allowed-keys '("\C-g"))
        (tab-alternatives '("\s" "\t" "\r"))
        (cursor-type nil))
    ;; Populate allowed keys and descriptions keys
    ;; available with CURRENT selector.
    (let ((re (format "\\`%s\\(.\\)\\'"
          (if current (regexp-quote current) "")))
          (prefix (if current (concat current " ") "")))
      (dolist (entry table)
        (pcase entry
          ;; Description.
          (`(,(and key (pred (string-match re))) ,desc)
           (let ((k (match-string 1 key)))
       (push k des-keys)
       ;; Keys ending in tab, space or RET are equivalent.
       (if (member k tab-alternatives)
           (push "\t" allowed-keys)
         (push k allowed-keys))
       (insert (propertize prefix 'face 'font-lock-comment-face) (propertize k 'face 'bold) (propertize "›" 'face 'font-lock-comment-face) "  " desc "…" "\n")))
          ;; Usable entry.
          (`(,(and key (pred (string-match re))) ,desc . ,_)
           (let ((k (match-string 1 key)))
       (insert (propertize prefix 'face 'font-lock-comment-face) (propertize k 'face 'bold) "   " desc "\n")
       (push k allowed-keys)))
          (_ nil))))
    ;; Insert special entries, if any.
    (when specials
      (insert "─────────────────────────\n")
      (pcase-dolist (`(,key ,description) specials)
        (insert (format "%s   %s\n" (propertize key 'face '(bold all-the-icons-red)) description))
        (push key allowed-keys)))
    ;; Display UI and let user select an entry or
    ;; a sub-level prefix.
    (goto-char (point-min))
    (unless (pos-visible-in-window-p (point-max))
      (org-fit-window-to-buffer))
    (let ((pressed (org--mks-read-key allowed-keys prompt)))
      (setq current (concat current pressed))
      (cond
       ((equal pressed "\C-g") (user-error "Abort"))
       ;; Selection is a prefix: open a new menu.
       ((member pressed des-keys))
       ;; Selection matches an association: return it.
       ((let ((entry (assoc current table)))
          (and entry (throw 'exit entry))))
       ;; Selection matches a special entry: return the
       ;; selection prefix.
       ((assoc current specials) (throw 'exit current))
       (t (error "No entry available")))))))
  (when buffer (kill-buffer buffer))))))
(advice-add 'org-mks :override #'org-mks-pretty)

(setf (alist-get 'height +org-capture-frame-parameters) 15)
      ;; (alist-get 'name +org-capture-frame-parameters) "❖ Capture") ;; ATM hardcoded in other places, so changing breaks stuff
(setq +org-capture-fn
      (lambda ()
        (interactive)
        (set-window-parameter nil 'mode-line-format 'none)
        (org-capture)))

(after! org-agenda
  (org-super-agenda-mode))

(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-tags-column 100 ;; from testing this seems to be a good value
      org-agenda-compact-blocks t)

(setq org-agenda-custom-commands
      '(("n" "Overview"
         ((agenda "" ((org-agenda-span 'day)
                      (org-super-agenda-groups
                       '((:name "Today"
                                :time-grid t
                                :date today
                                :todo "TODAY"
                                :scheduled today
                                :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:name "Next to do"
                                 :todo "NEXT"
                                 :order 1)
                          (:name "Important"
                                 :tag "Important"
                                 :priority "A"
                                 :order 6)
                          (:name "Due Today"
                                 :deadline today
                                 :order 2)
                          (:name "Due Soon"
                                 :deadline future
                                 :order 8)
                          (:name "Overdue"
                                 :deadline past
                                 :face error
                                 :order 7)
                          ;; (:name "Issues"
                          ;;        :tag "Issue"
                          ;;        :order 12)
                          (:name "Emacs"
                                 :tag "emacs"
                                 :order 13)
                          (:name "Projects"
                                 :tag "project"
                                 :order 14)
                          (:name "Research"
                                 :tag "research"
                                 :order 15)
                          (:name "To read"
                                 :tag "read"
                                 :order 30)
                          (:name "Waiting"
                                 :todo "WAITING"
                                 :order 20)
                          (:name "University"
                                 :tag "uni"
                                 :order 32)
                          (:name "School"
                                 :tag "school"
                                 :order 32)
                          (:name "Abitur"
                                 :tag "abi"
                                 :order 30)
                          (:name "Trivial"
                                 :priority<= "E"
                                 :tag ("trivial" "unimportant" "rec")
                                 :todo ("SOMEDAY" )
                                 :order 90)
                          (:discard (:tag ("Chore" "Routine" "Daily")))))))))))

;; org tree slide
(after! org
  (setq org-tree-slide-breadcrumbs nil
        org-tree-slide-header nil
        org-tree-slide-slide-in-effect nil
        org-tree-slide-heading-emphasis nil
        org-tree-slide-cursor-init t
        org-tree-slide-modeline-display nil
        org-tree-slide-skip-done nil
        org-tree-slide-skip-comments t
        org-tree-slide-fold-subtrees-skipped t
        org-tree-slide-skip-outline-level 8
        org-tree-slide-never-touch-face t))


;; org mode
(setq org-directory "~/org"
      org-default-notes-file (concat org-directory "/notes.org"))

(with-eval-after-load 'ox
  (require 'ox-hugo))

;; (require 'org)
(after! org
  (require 'org-drill)
  (custom-set-faces!
    '(outline-1 :weight extra-bold :height 1.25)
    '(outline-2 :weight bold :height 1.15)
    '(outline-3 :weight bold :height 1.12)
    '(outline-4 :weight semi-bold :height 1.09)
    '(outline-5 :weight semi-bold :height 1.06)
    '(outline-6 :weight semi-bold :height 1.03)
    '(outline-8 :weight semi-bold)
    '(org-document-title :height 1.2)
    '(outline-9 :weight semi-bold))
  (setq org-ellipsis "  ")
  (setq org-cycle-separator-lines -1)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(D)" "CANCELLED(C)")
          (sequence "ACT(a)" "|" "ACTED(A)")
          (sequence "BUY(b)" "|" "BOUGHT(B)")
          (sequence "MEET(m)" "|" "MET(M)" "POSTPONED(P)")
          (sequence "STUDY(s)" "|" "STUDIED(S)")))
;; make background of fragments transparent
;; (let ((dvipng--plist (alist-get 'dvipng org-preview-latex-process-alist)))
;;   (plist-put dvipng--plist :use-xcolor t)
;;   (plist-put dvipng--plist :image-converter '("dvipng -D %D -bg 'transparent' -T tight -o %O %f")))
  (add-hook! 'doom-load-theme-hook
    (defun +org-refresh-latex-background ()
      (plist-put! org-format-latex-options
                  :background
                  (face-attribute (or (cadr (assq 'default face-remapping-alist))
                                      'default)
                                  :background nil t))))
  (setq org-fontify-done-headline nil
        org-highlight-latex-and-related '(native script entities)
        org-fontify-whole-heading-line nil
        org-enforce-todo-dependencies t
        org-enforce-todo-checkbox-dependencies t
        org-track-ordered-property-with-tag t
        org-highest-priority ?a
        org-lowest-priority ?c
        org-default-priority ?a
      ;;   org-capture-templates
      ;; '(("b" "basic task" entry
      ;;   (file+headline "todo.org" "basic tasks that need to be reviewed")
      ;;   "* TODO %?")
      ;;   ("n" "notes" entry
      ;;    (file+headline "notes.org" "Quick note taking")
      ;;    "** %?")
      ;;   ("c" "capture some concise actionable item and exit immediately" entry
      ;;   (file+headline "todo.org" "task list without a defined date")
      ;;   "* TODO [#b] %^{title}\n :properties:\n :captured: %u\n :end:\n\n %i %l" :immediate-finish t)
      ;;   ("t" "task of importance with a tag, deadline, and further editable space" entry
      ;;   (file+headline "todo.org" "task list with a date")
      ;;   "* %^{scope of task||TODO [#a]|STUDY [#a]|MEET meet with} %^{title} %^g\n deadline: %^t\n :properties:\n :context: %a\n :captured: %u\n :end:\n\n %i %?")
      ;;   ("i" "idea")
      ;;   ("ia" "activity or event" entry
      ;;   (file+headline "ideas.org" "activities or events")
      ;;   "* act %^{act about what}%? :private:\n :properties:\n :captured: %u\n :end:\n\n %i")
      ;;   ("ie" "essay or publication" entry
      ;;   (file+headline "ideas.org" "essays or publications")
      ;;   "* study %^{expound on which thesis}%? :private:\n :properties:\n :captured: %u\n :end:\n\n %i")
      ;;   ("iv" "video blog or screen cast" entry
      ;;   (file+headline "ideas.org" "screen casts or vlogs")
      ;;   "* record %^{record on what topic}%? :private:\n :properties:\n :captured: %u\n :end:\n\n %i"))
      ))

(setq hl-todo-keyword-faces
      '(("TODO"      . warning)
        ("ACT"       . warning)
        ("BUY"       . warning)
        ("MEET"      . warning)
        ("STUDY"     . warning)
        ("REVIEW"    . warning)
        ("FIXME"     . warning)
        ("DONE"      . success)
        ("ACTED"     . success)
        ("BOUGHT"    . success)
        ("MET"       . success)
        ("STUDIED"   . success)
        ("CANCELLED"  . error)
        ("POSTPONED" . error)
        ))

;; ;; stolen from reddit
;; (setq-hook! org-mode
;;   org-log-done t
;;   org-image-actual-width '(700)
;;   org-clock-into-drawer t
;;   org-clock-persist t
;;   org-columns-default-format "%60ITEM(Task) %20TODO %10Effort(Effort){:} %10CLOCKSUM"
;;   org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
;;                                 ("STYLE_ALL" . "habit")))
;;   ;; org-plantuml-jar-path (expand-file-name "~/Downloads/plantuml.jar")
;;   ;; org-export-babel-evaluate nil
;;   org-confirm-babel-evaluate nil
;;   ;; org-todo-keywords '((sequence "TODO" "WAITING" "|" "DONE"))
;;   org-archive-location "~/org/archive/todo.org.gpg::"
;;   org-duration-format '((special . h:mm))
;;   org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
;;   bidi-paragraph-direction t
;;   org-icalendar-timezone "Europe/Berlin"
;;   org-hide-emphasis-markers t
;;   org-fontify-done-headline t
;;   org-fontify-whole-heading-line t
;;   org-fontify-quote-and-verse-blocks t
;;   )
;; (setq org-agenda-block-separator (string-to-char " ")
;;     org-deadline-warning-days 7
;;     org-agenda-breadcrumbs-separator " ❱ "
;;     org-agenda-format-date 'my-org-agenda-format-date-aligned)
;; automatically toggle latex previews
;; (add-hook 'org-mode-hook 'org-fragtog-mode)
;; changing the bullets in org-mode
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(setq org-superstar-headline-bullets-list '( "⁖" "⁖" "⁖" "⁖" "⁖" ))
;; (setq org-superstar-headline-bullets-list '("☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷"))
(setq org-refile-targets '((nil :maxlevel . 9)
                                (org-agenda-files :maxlevel . 9)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling
;; (setq bookmark-default-file '("/Users/supremesnickers/.config/doom/bookmarks"))

(setq deft-directory "~/org")

(setq org-fontify-quote-and-verse-blocks t
      org-list-allow-alphabetical t               ; have a. A. a) A) list bullets
      org-catch-invisible-edits 'smart)           ; try not to accidently do weird stuff in invisible regions

;; (add-hook! 'org-mode-hook #'+org-pretty-mode #'mixed-pitch-mode)
(setq projectile-project-search-path '("~/cs" "~/dotfiles" "~/clones"))
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

(provide 'org-config)
