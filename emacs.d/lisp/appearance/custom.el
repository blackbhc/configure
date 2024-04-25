(use-package exotica-theme
  :ensure t
  :config
  (setq exotica-theme-enable-italics t))

(load-theme 'exotica t)
  
(use-package all-the-icons
  :if (display-graphic-p))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indent-guides-method 'character))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
