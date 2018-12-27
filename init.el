(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

;; KR encoding
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)

;; Use command as control in macOS 
(setq mac-command-modifier 'control)

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Show line numbers
(global-linum-mode)
(column-number-mode)

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; increase font size for better readability

(defun large-dpi ()
  (set-face-attribute 'default nil :height 160 :font "D2Coding"))

(defun small-dpi ()
  (set-face-attribute 'default nil :height 80 :font "D2Coding"))

(large-dpi)

;; Korean font settings
;; Refered to http://crazia.tistory.com/entry/Emacs-24x-%EB%B2%84%EC%A0%BC-%ED%95%9C%EA%B8%80-%ED%8F%B0%ED%8A%B8-%EC%84%A4%EC%A0%95-orgmode-%EC%9D%98-%ED%95%9C%EA%B8%80-%ED%85%8C%EC%9D%B4%EB%B8%94-%EA%B9%A8%EC%A7%80%EC%A7%80-%EC%95%8A%EA%B2%8C-%EB%B3%B4%EC%9D%B4%EA%B8%B0
(defun set-hangul-font (&optional frame)
  (with-selected-frame (or frame (selected-frame))
    (set-fontset-font t 'hangul (font-spec :name "D2Coding") frame)))

(set-hangul-font)
(add-hook 'after-make-frame-functions 'set-hangul-font)

;; Default encoding for processes (in WSL, it is nil)
(add-to-list 'process-coding-system-alist '(utf-8-unix . utf-8-unix))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html

      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; no bell
(setq ring-bell-function 'ignore)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(windmove-default-keybindings)

;; This is only needed once, near the top of the file
(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/use-package")
  (require 'use-package))

(use-package dired-x
  :bind ("C-x C-j" . dired-jump))

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package magit
  :ensure t
  :bind ("C-c g" . magit-status))

(use-package helm
  :ensure t
  :demand t
  :config
  (bind-keys ("M-x" . helm-M-x)
             ("M-y" . helm-show-kill-ring)
             ("C-x C-f" . helm-find-files)
             ("C-x b" . helm-mini))
  :bind (:map helm-map
	      ("<tab>" . helm-execute-persistent-action)
	      ("C-i" . helm-execute-persistent-action)
	      ("C-Z" . helm-select-action)))

(use-package projectile
  :ensure t)

(use-package helm-projectile
  :ensure t
  :bind
  ("C-c p p" . helm-projectile-switch-project)
  ("C-c p b" . helm-projectile-switch-to-buffer)
  ("C-c p f" . helm-projectile-find-file))

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package rainbow-delimiters
  :ensure t)

(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region))

(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode))

(use-package ace-jump-mode
  :ensure t
  :bind ("C-." . ace-jump-mode))

(use-package dracula-theme
  :ensure t)

;; Language Supports
;; OCaml
(use-package tuareg
  :ensure t
  :commands tuareg-mode)

(use-package merlin
  :ensure t
  :hook (tuareg-mode . merlin-mode))

(use-package web-mode
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (merlin tuareg yaml-mode web-mode vlf use-package undo-tree twilight-bright-theme tide swiper-helm robe rjsx-mode restclient rainbow-delimiters prettier-js persp-mode parinfer paredit magit lsp-ui lsp-python lsp-javascript-typescript lsp-haskell lispy json-mode intero inf-clojure indium helm-projectile helm-gtags helm-ag ggtags flycheck-ycmd flycheck-pos-tip flycheck-clojure feature-mode expand-region exec-path-from-shell ensime elpy ein dracula-theme dockerfile-mode cquery company-ycmd company-lsp challenger-deep-theme alchemist ag add-node-modules-path ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
