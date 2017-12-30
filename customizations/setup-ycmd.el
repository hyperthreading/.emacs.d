(require 'ycmd)
(require 'company-ycmd)
(require 'flycheck-ycmd)
(require 'ycmd-eldoc)

(company-ycmd-setup)
(flycheck-ycmd-setup)

;; Show completions after 0.3 seconds
(setq company-idle-delay 0.3)


(add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)

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

;; Show flycheck errors in idle-mode as well
;; (setq ycmd-parse-conditions '(save new-line mode-enabled idle-change))

;; Makes emacs-ycmd less verbose
;; (setq url-show-status nil)
