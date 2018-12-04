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
(setq mac-command-modifier 'control)

;; This is only needed once, near the top of the file
(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/use-package")
  (require 'use-package))

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
  :config
  (bind-keys ("M-x" . helm-M-x)
             ("M-y" . helm-show-kill-ring)
             ("C-x C-f" . helm-find-files)
             ("C-x b" . helm-mini)))

(use-package projectile
  :ensure t)

(use-package helm-projectile
  :ensure t
  :bind
  ("C-c p p" . helm-projectile-switch-project)
  ("C-c p b" . helm-projectile-switch-to-buffer)
  ("C-c p f" . helm-projectile-find-file))

(use-package company
  :ensure t)

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

