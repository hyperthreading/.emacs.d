(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck '(flycheck-clojure-setup))
(eval-after-load 'flycheck
  '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
