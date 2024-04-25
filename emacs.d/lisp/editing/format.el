;;; format.el --- Load the plugins for code formatting
;;; Commentary:
;; format-all
;;; Code:

(use-package format-all
  :ensure t
  :preface
  (defun ian/format-code ()
    "Auto-format whole buffer."
    (interactive)
    (if (derived-mode-p 'prolog-mode)
        (prolog-indent-buffer)
      (format-all-buffer)))
  :config
  (global-set-key (kbd "M-F") #'ian/format-code)
  (add-hook 'prog-mode-hook #'format-all-ensure-formatter)
  (add-hook 'after-save-hook 'format-all-buffer)
  (setq-default format-all-formatters
                '(("C"     (clang-format "-i"))
		  ("CPP"     (clang-format "-i"))
		  ("Rust" (rustfmt))
                  ("Shell" (shfmt "-i" "4" "-ci"))
		  ("Python" (black)))))

(provide 'format)
