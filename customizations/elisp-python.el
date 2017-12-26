;; (elpy-use-ipython)

;; use flycheck not flymake with elpy
;; (when (require 'flycheck nil t)
  ;; (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  ;; (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;; note that setting `venv-location` is not necessary if you
;; use the default location (`~/.virtualenvs`), or if the
;; the environment variable `WORKON_HOME` points to the right place
(setq venv-location '("~/pierre/"))
