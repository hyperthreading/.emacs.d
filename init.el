(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize) 


(setq package-list '(use-package

		      exec-path-from-shell

                      flycheck-pos-tip
                      
                      cider
                      inf-clojure
                      flycheck-clojure

                      paredit
                      lispy

                      robe
                      
                      ;; Put some major modes here
                      ;; JavaScript Development
                      web-mode
                      rjsx-mode
                      js2-mode
                      json-mode

                      dockerfile-mode

                      ;; Markdown
                      markdown-mode

                      restclient

                      ;; Project Management
                      
                      magit
                      ;; Package not found 18.01.29
                      ;; dired+ 
                      projectile
                      helm
                      helm-projectile
                      helm-gtags

                      persp-mode
                      lsp-mode
                      lsp-ui
                      lsp-python
                      lsp-haskell
                      lsp-javascript-typescript
                      cquery
                      company-lsp
                      
                      ace-jump-mode
                      swiper
                      swiper-helm

                      ;; Python Support
                      ein

                      ;; Theme
                      challenger-deep-theme
                      twilight-bright-theme
                      
                      rainbow-delimiters
                      expand-region
                      undo-tree

                      ycmd
                      company-ycmd
                      flycheck-ycmd

                      vlf))

		     
; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(use-package ensime
  :ensure t
  :pin melpa)

(use-package sbt-mode
  :pin melpa)

(use-package scala-mode
  :pin melpa)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" "2fb337439962efc687d9f9f2bf7263e6de3e6b4b910154a02927c2a70acf496c" default)))
 '(package-selected-packages
   (quote
    (dockerfile-mode helm-gtags cquery lsp-haskell lispy vlf restclient robe web-mode twilight-bright-theme parinfer persp-mode-projectile-bridge multiple-cursors persp-mode swiper-helm swiper company-jedi lsp-ui company-quickhelp undo-tree inf-clojure jedi python-mode ein use-package smartparens rainbow-delimiters flycheck-clojure flycheck-pos-tip ace-jump-mode challenger-deep-theme company-lsp markdown-mode helm-projectile flycheck-ycmd company-ycmd ycmd company flycheck expand-region projectile dired+ magit json-mode rjsx-mode paredit cider)))
 '(safe-local-variable-values
   (quote
    ((eval progn
           (add-to-list
            (quote exec-path)
            (concat
             (locate-dominating-file default-directory ".dir-locals.el")
             "node_modules/.bin/")))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-html-tag-face ((t (:inherit font-lock-function-name-face)))))

(add-to-list 'load-path "~/.emacs.d/customizations")

(load "ui.el")
(load "navigation.el")
(load "editing.el")
(load "editing-lisp.el")
(load "editing-clang.el")
(load "editing-js.el")
(load "editing-ruby.el")
(load "shell-integration.el")
(load "setup-company.el")
(load "setup-flycheck.el")
(load "setup-projectile.el")
(load "setup-clojure.el")
(load "setup-cider.el")
(load "setup-helm.el")
(load "setup-lsp.el")
;; (load "setup-ycmd.el")
(load "misc.el")
(load "keybindings.el")
