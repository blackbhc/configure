;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:
;; version check, by Steve Purcell
(let ((minver "29.1")) 
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

;; append the configuration path
(add-to-list 'load-path (expand-file-name "lisp/core_enhance" user-emacs-directory)) ; enhance the core functions
(add-to-list 'load-path (expand-file-name "lisp/appearance" user-emacs-directory))   ; appearance related
(add-to-list 'load-path (expand-file-name "lisp/editing" user-emacs-directory))      ; editting related
(add-to-list 'load-path (expand-file-name "lisp/keymaps" user-emacs-directory))      ; keymaps related

;; Enable with t if you prefer
(defconst *spell-check-support-enabled* nil) 
(defconst *is-a-mac* (eq system-type 'darwin))

;; Adjust garbage collection thresholds during startup, and thereafter
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;;; Config package sources
(require 'package)
;; mirror of SJTU
(setq package-archives '(("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
                         ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")))
(package-initialize)
(eval-when-compile (require 'use-package))

;;; Individual part
;; core enhance part
(require 'global)
(require 'search)
(require 'window)
;; keymaps part
(require 'keys)
;; editing part
(require 'vimode)
(require 'completion)
(require 'snip)
(require 'rainbow)
(require 'syntax)
(require 'format)
(require 'lsp)
(require 'tree)
;; appearance part
(require 'modeline)
(require 'minibuffer)
(require 'startup)

;; custom files
(setq custom-file "~/.emacs.d/lisp/appearance/custom.el")
(load custom-file)

(provide 'init)
