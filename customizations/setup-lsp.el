(require 'lsp-mode)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq lsp-ui-doc-background "#FFFFFF")
(setq lsp-ui-doc-border "#505050")

(require 'lsp-javascript-typescript)
;; (add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable) ;; for typescript support

(defun my-company-transformer (candidates)
  (let ((completion-ignore-case t))
    (all-completions (company-grab-symbol) candidates)))

(defun my-js-hook nil
  (make-local-variable 'company-transformers)
  (push 'my-company-transformer company-transformers))

;; (add-hook 'web-mode-hook 'my-js-hook)

;; (add-to-list 'load-path "~/.emacs.d/packages/lsp-javascript")
;; (require 'lsp-javascript-flow)

;; (add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
;; (add-hook 'js2-mode-hook #'lsp-javascript-typescript-enable) ;; for js3-mode support
;; (add-hook 'rjsx-mode-hook #'lsp-javascript-typescript-enable) ;; for rjsx-mode support
;; (add-hook 'web-mode-hook #'lsp-javascript-typescript-enable)

(require 'lsp-python)
;; (add-hook 'python-mode-hook #'lsp-python-enable)

(require 'lsp-haskell)
(add-hook 'haskell-mode-hook #'lsp-haskell-enable)

(require 'cquery)
(setq cquery-executable "~/cquery/build/release/bin/cquery")
;;(add-hook 'c-mode-hook #'lsp-cquery-enable)


