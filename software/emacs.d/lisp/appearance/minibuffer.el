;;; minibuffer.el --- Load the plugins for minibuffer enhancement
;;; Commentary:
;; marginalia
;;; Code:

(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
			  ("M-A" . marginalia-cycle)))

(provide 'minibuffer)
