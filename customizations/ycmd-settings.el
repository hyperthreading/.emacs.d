;; ycmd

;;; Googlers can replace a lot of this with (require 'google-ycmd).

(require 'ycmd)
(require 'company-ycmd)
(require 'flycheck-ycmd)
(require 'ycmd-eldoc)

;; (global-ycmd-mode)
(company-ycmd-setup)
(flycheck-ycmd-setup)

;; Show completions after 0.05 seconds
(setq company-idle-delay 0.25)

;; Activate for editing C++ files
(add-hook 'after-init-hook #'global-ycmd-mode)
(add-hook 'after-init-hook 'ycmd-mode)
(add-hook 'after-init-hook 'company-mode)
(add-hook 'after-init-hook 'flycheck-mode)

(add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)

;; Replace the directory information with where you downloaded ycmd to
;; "python3 /mnt/c/Users/no1ex/ycmd/ycmd"

;; Careful w/ this variable since it can even prevent emacs from startup
(let ((is-windows (eq system-type 'windows-nt)))
  (let ((python-executable (if is-windows "python" "python3"))
        (path-to-ycmd (if is-windows
                          "c:/ycmd/ycmd"
                        "/home/carl/ycmd/ycmd"
                        )))
    (set-variable 'ycmd-server-command
                  (list python-executable path-to-ycmd))))

;; Let some compatible modes get the completion feature such as RJSX
(set-variable 'ycmd-file-type-map
   (quote
    ((c++-mode "cpp")
     (c-mode "c")
     (caml-mode "ocaml")
     (csharp-mode "cs")
     (d-mode "d")
     (erlang-mode "erlang")
     (emacs-lisp-mode "elisp")
     (go-mode "go")
     (js-mode "javascript")
     (js2-mode "javascript")
     (lua-mode "lua")
     (objc-mode "objc")
     (perl-mode "perl")
     (cperl-mode "perl")
     (php-mode "php")
     (python-mode "python")
     (ruby-mode "ruby")
     (rust-mode "rust")
     (scala-mode "scala")
     (tuareg-mode "ocaml")
     (typescript-mode "typescript")
     (rjsx-mode "javascript"))))
;; Edit according to where you have your Chromium/Blink checkout
;; (add-to-list 'ycmd-extra-conf-whitelist (substitute-in-file-name "$HOME/dev/blink/.ycm_extra_conf.py"))

;; Show flycheck errors in idle-mode as well
(setq ycmd-parse-conditions '(save new-line mode-enabled idle-change))

;; Makes emacs-ycmd less verbose
(setq url-show-status nil)

;; (defun ycmd-setup-completion-at-point-function ()
;;   "Setup `completion-at-point-functions' for `ycmd-mode'."
;;   (add-hook 'completion-at-point-functions
;;             #'ycmd-complete-at-point nil :local))

;; (add-hook 'ycmd-mode #'ycmd-setup-completion-at-point-function)
