(use-package exotica-theme
  :ensure t
  :config
  (setq exotica-theme-enable-italics t))

(load-theme 'exotica t)
  
(use-package all-the-icons
  :if (display-graphic-p))

