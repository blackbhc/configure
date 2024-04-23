;;; vimode.el --- Load the evil-mode
;;; Commentary:
;; evil
;;; Code:

(use-package evil
  :ensure t
  :hook
  (prog-mode . evil-mode))

(provide 'vimode)
