;;; org-config.el --- Load the configuration of org-mode
;;; Commentary:
;; 
;;; Code:


;; mobile org path
(setq org-mobile-directory 
      "~/Library/Mobile Documents/iCloud~com~mobileorg~mobileorg/Documents")

;; key-binds
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; todo items
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)" "CANCELED(c)") ; ordinary
        (sequence "BUG(b)" "|" "FIXED(f)")               ; programming
        (sequence "SURVEY(s)" "EXPLORE(e)" "REVIEW(r)" "SUMMARY(y)" "|" "REPORT(p)")       ; study
        ))
(setq org-log-done 'note) ; add a note for todo status switch

;; global tags 
(setq org-tag-alist '(("work" . ?w) ("study" . ?s) ("learn" . ?l) ("life" . ?e)))

(provide 'org-config)
