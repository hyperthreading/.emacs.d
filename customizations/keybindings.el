
; Editing keybinds
(global-set-key (kbd "C-<kanji>") 'set-mark-command)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-=") 'er/expand-region)
(define-key global-map (kbd "C-c j") 'ace-jump-mode)

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Lisp Editings
(global-set-key (kbd "C-,") 'parinfer-toggle-mode)


;; Magit status
(global-set-key (kbd "C-c g") 'magit-status)

;; helm setup
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-c p p") 'helm-projectile-switch-project)
(global-set-key (kbd "C-c p b") 'helm-projectile-switch-to-buffer)
(global-set-key (kbd "C-c p a") 'helm-projectile-ag)
(global-set-key (kbd "C-c p f") 'helm-projectile-find-file)


;; rebind tab to run persistent action
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
;; make TAB work in terminal
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
;; list actions using C-z
(define-key helm-map (kbd "C-z")  'helm-select-action)


(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-\\") 'helm-imenu)

(global-set-key (kbd "<f10>") 'shell)
