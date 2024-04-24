;;; org-config.el --- Load the configuration of org-mode
;;; Commentary:
;; 
;;; Code:

;; key-binds
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; todo items
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)" "CANCELED(c)") ; ordinary
        (sequence "BUG(b)" "|" "FIXED(f)")               ; programming
        (sequence "SURVEY(s)" "EXPLORE(e)" "REVIEW(r)" "SUMMARY(y)" "|" "REPORT(p)")       ; study
        ))
(setq org-log-done 'note) ; add a note for todo status switch

;; global tags 
(setq org-tag-alist '(("@Work" . ?w) ("@Study" . ?s) ("@Learn" . ?l) ("@Life" . ?e)))

;; captures
(global-set-key "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Documents/Orgs/gtd.org" "Tasks")
         "* TODO %?\n %T\n %i\n %a")
        ("c" "Idea of computer" entry (file+datetree "~/Documents/Orgs/idea.org" "Computer")
         "* %?\n %T\n %i\n %a")
        ("m" "Idea of mathematics" entry (file+datetree "~/Documents/Orgs/idea.org" "Math")
         "* %?\n %T\n %i\n %a")
        ("p" "Idea of physics" entry (file+datetree "~/Documents/Orgs/idea.org" "Physics")
         "* %?\n %T\n %i\n %a")))

;; enable indent-mode by default
(add-hook 'org-mode-hook 'org-indent-mode)
(provide 'org-config)
