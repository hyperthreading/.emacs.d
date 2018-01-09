(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize) 

(setq package-list '(cider

		     paredit

                     ;; Put some major modes here
		     ;; JavaScript Development
		     rjsx-mode
		     js2-mode
		     json-mode

                     ;; Markdown
                     markdown-mode

		     magit
		     dired+
		     projectile
                     helm
                     helm-projectile

                     ;; Editing features
		     flycheck
                     flycheck-pos-tip
                     flycheck-clojure
                     
		     company
                     company-lsp
                     lsp-mode
                     lsp-javascript-typescript
                     ace-jump-mode

                     ;; Python Support
                     ein

                     ;; Theme
                     challenger-deep-theme
                     
		     rainbow-delimiters
		     expand-region

		     ycmd
		     company-ycmd
		     flycheck-ycmd))

		     
; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (jedi python-mode ein use-package smartparens rainbow-delimiters flycheck-clojure flycheck-pos-tip ace-jump-mode challenger-deep-theme lsp-javascript-typescript company-lsp markdown-mode helm-projectile flycheck-ycmd company-ycmd ycmd company flycheck expand-region projectile dired+ magit json-mode rjsx-mode paredit cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/customizations")

(load "ui.el")
(load "navigation.el")
(load "editing.el")
(load "editing-elisp.el")
(load "shell-integration.el")
(load "setup-company.el")
(load "setup-flycheck.el")
(load "setup-projectile.el")
(load "setup-clojure.el")
(load "setup-cider.el")
(load "setup-helm.el")
(load "setup-helm-projectile.el")
(load "setup-lsp.el")
;; (load "setup-ycmd.el")
(load "misc.el")
(put 'scroll-left 'disabled nil)
