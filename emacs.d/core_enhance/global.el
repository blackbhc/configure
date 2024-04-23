;;; global.el --- global configurations
;;; Commentary:
;;; Code:

(setq confirm-kill-emacs #'yes-or-no-p)                ; confirm when close
(electric-pair-mode t)                                 ; automatic pairs
(add-hook 'prog-mode-hook #'show-paren-mode)           ; highlight parantheses
(column-number-mode t)                                 ; show line number
(setq display-line-numbers-type 'relative)             ; show relative line number
(global-auto-revert-mode t)                            ; automatic reload files
(delete-selection-mode t)                              ; change files when editing on selected texts
(setq make-backup-files nil)                           ; no backup for every files
(add-hook 'prog-mode-hook #'hs-minor-mode)             ; fold code blocks
(global-display-line-numbers-mode 1)                   ; show line numbers in windows
(when (display-graphic-p) (toggle-scroll-bar -1))      ; no scroll bar for GUI
(savehist-mode 1)                                      ; save buffer history
(set-frame-parameter (selected-frame) 'alpha '(85 85)) ; transparency 
(add-to-list 'default-frame-alist '(alpha 85 85))
(set-face-attribute 'default nil :font "Monospace-16" )
;(set-face-attribute 'default nil :background "black"   ; tranparent backgroud
;  :foreground "white" :height 180)
(provide 'global)
