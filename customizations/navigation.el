
;; "When several buffers visit identically-named files,
;; Emacs must give the buffers distinct names. The usual method
;; for making buffer names unique adds ‘<2>’, ‘<3>’, etc. to the end
;; of the buffer names (all but one of them).
;; The forward naming method includes part of the file's directory
;; name at the beginning of the buffer name
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(autoload 'dired-jump "dired-x"
  "Jump to Dired buffer corresponding to current buffer." t)

(autoload 'dired-jump-other-window "dired-x"
  "Like \\[dired-jump] (dired-jump) but in other window." t)


(define-key global-map "\C-x\C-j" 'dired-jump)
(define-key global-map "\C-x4\C-j" 'dired-jump-other-window)

;; windmove
;; (global-set-key (kbd "C-<")  'windmove-left)
;; (global-set-key (kbd "C->") 'windmove-right)
;; (global-set-key (kbd "C-\"")    'windmove-up)
;; (global-set-key (kbd "C-:")  'windmove-down)
(windmove-default-keybindings)

(global-set-key (kbd "s-w") 'delete-window)

;; Perspectives
;; (require 'persp-mode)
;; (persp-set-keymap-prefix (kbd "C-c q"))

;; (with-eval-after-load "persp-mode-autoloads"
;;   (setq wg-morph-on nil) ;; switch off animation
;;   (setq persp-autokill-buffer-on-remove 'kill-weak)
;;   (add-hook 'after-init-hook #'(lambda () (persp-mode 1))))

;; (with-eval-after-load "persp-mode-projectile-bridge-autoloads"
;;   (add-hook 'persp-mode-projectile-bridge-mode-hook
;;             #'(lambda ()
;;                 (if persp-mode-projectile-bridge-mode
;;                     (persp-mode-projectile-bridge-find-perspectives-for-all-buffers)
;;                   (persp-mode-projectile-bridge-kill-perspectives))))
;;   (add-hook 'after-init-hook
;;             #'(lambda ()
;;                 (persp-mode-projectile-bridge-mode 1))
;;             t))
