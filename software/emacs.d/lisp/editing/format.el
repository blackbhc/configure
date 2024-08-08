;;; format.el --- Load the plugins for code formatting
;;; Commentary:
;; format-all
;;; Code:

(use-package format-all
  :ensure t
  :commands format-all-mode
  :hook (prog-mode . format-all-mode)
  :config
  (setq-default format-all-formatters
                '(("C"      (clang-format "-i"))
		  ("Rust"   (rustfmt))
                  ("Shell"  (shfmt "-i" "4" "-ci"))
		  ("Python" (black))))
  :bind (("C-c M-f" . 'format-all-region-or-buffer)))

(provide 'format)
