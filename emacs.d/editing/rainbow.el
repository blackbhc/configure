;;; rainbow.el --- Load the plugins for rainbow delimiters
;;; Commentary:
;; rainbow-delimiters
;;; Code:

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'rainbow)
