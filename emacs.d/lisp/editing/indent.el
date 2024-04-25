;;; format.el --- Load the plugins for indentation highlight
;;; Commentary:
;; highlight-indent-guides
;;; Code:

(use-package highlight-indent-guides
  :ensure t
  :init (setq highlight-indent-guides-method 'character)
  :bind ("C-x M-h" . highlight-indent-guides-mode))

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(provide 'indent)
