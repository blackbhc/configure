;;; modeline.el --- Load the plugins for mode line enchance
;;; Commentary:
;; smart-mode-line
;;; Code:

(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t)  ; avoid asking when startup
  (sml/setup)
  :config
  (setq rm-blacklist
    (format "^ \\(%s\\)$"
      (mapconcat #'identity
        '("Projectile.*" "company.*" "Google"
	  "Undo-Tree" "counsel" "ivy" "yas" "WK")
         "\\|"))))

(provide 'modeline)
