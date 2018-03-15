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

(add-hook 'web-mode-hook
  '(lambda ()
    (add-to-list 'web-mode-content-types-alist
                 '("jsx" . "\\.jsx\\'")
                 '("javascript" . "\\.js\\'"))
    (setq web-mode-enable-auto-quoting nil)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-code-indent-offset 2)))



