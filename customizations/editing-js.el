(require 'js2-mode)

(setq js-indent-level 2)

(require 'rjsx-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(add-hook 'web-mode-hook
  '(lambda ()
    (add-to-list 'web-mode-content-types-alist
                 '("jsx" . "\\.jsx\\'")
                 '("javascript" . "\\.js\\'"))
    (setq web-mode-enable-auto-quoting nil)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-code-indent-offset 2)))

(require 'prettier-js)

(setq prettier-js-args
      '("--trailing-comma" "es5"
        "--bracket-spacing" "true"
        "--single-quote" "true"
        "--parser" "typescript"))

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))

(defun enable-by-extension ()
  (progn
    (enable-minor-mode
     '("\\.jsx?\\'" . (lambda () (progn (prettier-js-mode)
                                        (setup-tide-mode)))))
    (enable-minor-mode
     '("\\.tsx?\\'" . (lambda () (progn (prettier-js-mode)
                                        (setup-tide-mode)))))))

(add-hook 'web-mode-hook #'enable-by-extension)
(add-hook 'web-mode-hook #'add-node-modules-path)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
