;;; keys.el --- Load the plugins for keymaps enhancement
;;; Commentary:
;; which-key, hydra, mwin, undo-tree
;;; Code:

;; hydra
(use-package hydra
  :ensure t)
(use-package use-package-hydra
  :ensure t
  :after hydra) 

;; which-key
(use-package which-key
  :ensure t
  :init (which-key-mode))

;; enchance C-a & C-e
(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :custom
  (undo-tree-auto-save-history nil))

(provide 'keys)
