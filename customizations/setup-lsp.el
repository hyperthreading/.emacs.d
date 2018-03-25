(require 'lsp-mode)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq lsp-ui-doc-background "#FFFFFF")
(setq lsp-ui-doc-border "#505050")

(require 'lsp-javascript-typescript)
(add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
(add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable) ;; for typescript support
(add-hook 'js2-mode-hook #'lsp-javascript-typescript-enable) ;; for js3-mode support
(add-hook 'rjsx-mode-hook #'lsp-javascript-typescript-enable) ;; for rjsx-mode support
(add-hook 'web-mode-hook #'lsp-javascript-typescript-enable)

(require 'lsp-python)
(add-hook 'python-mode-hook #'lsp-python-enable)

(require 'lsp-haskell)
(add-hook 'haskell-mode-hook #'lsp-haskell-enable)
