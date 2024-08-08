;;; search.el --- Load the plugins for search enhancement
;;; Commentary:
;; ace-window
;;; Code:

(use-package ace-window
  :ensure t
  :bind (("C-x o" . 'ace-window)))

(provide 'window)
