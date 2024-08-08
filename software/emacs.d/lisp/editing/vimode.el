;;; vimode.el --- Load the evil-mode
;;; Commentary:
;; evil
;;; Code:

(use-package evil
  :ensure t
  :bind
    (:map global-map
        ("C-c M-v" . evil-mode)))

(provide 'vimode)
