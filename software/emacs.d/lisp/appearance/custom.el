(use-package color-theme-modern
  :ensure t
  :config)

(load-theme 'aliceblue t)
(enable-theme 'aliceblue)
  
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (list "~/Documents/Orgs" "~/Documents/Orgs/math" "~/Documents/Orgs/physics" "~/Documents/Orgs/projects"))
 '(package-selected-packages
   '(color-theme-modern andreas-theme yasnippet-snippets which-key use-package-hydra undo-tree treemacs-projectile tommyh-theme smart-mode-line rainbow-delimiters mwim lsp-ui lsp-treemacs lsp-ivy highlight-indent-guides evil dracula-theme dashboard counsel company-box amx all-the-icons)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
