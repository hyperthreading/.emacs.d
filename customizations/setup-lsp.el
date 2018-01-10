(require 'lsp-mode)
(require 'lsp-flycheck)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(require 'lsp-javascript-typescript)
(add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
(add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable) ;; for typescript support
(add-hook 'js2-mode-hook #'lsp-javascript-typescript-enable) ;; for js3-mode support
(add-hook 'rjsx-mode #'lsp-javascript-typescript-enable) ;; for rjsx-mode support

(require 'lsp-python)
(add-hook 'python-mode-hook #'lsp-python-enable)
