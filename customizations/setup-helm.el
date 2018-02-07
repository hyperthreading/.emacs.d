(require 'helm)
(require 'helm-projectile)
 
(helm-mode 1)

(setq projectile-completion-system 'helm)
(helm-projectile-on)
