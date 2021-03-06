
;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Show line numbers
(global-linum-mode)
(column-number-mode)

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; increase font size for better readability

(defun large-dpi ()
  (set-face-attribute 'default nil :height 160 :font "D2Coding"))

(defun small-dpi ()
  (set-face-attribute 'default nil :height 80 :font "D2Coding"))

(large-dpi)

;; Korean font settings
;; Refered to http://crazia.tistory.com/entry/Emacs-24x-%EB%B2%84%EC%A0%BC-%ED%95%9C%EA%B8%80-%ED%8F%B0%ED%8A%B8-%EC%84%A4%EC%A0%95-orgmode-%EC%9D%98-%ED%95%9C%EA%B8%80-%ED%85%8C%EC%9D%B4%EB%B8%94-%EA%B9%A8%EC%A7%80%EC%A7%80-%EC%95%8A%EA%B2%8C-%EB%B3%B4%EC%9D%B4%EA%B8%B0
(defun set-hangul-font (&optional frame)
  (with-selected-frame (or frame (selected-frame))
    (set-fontset-font t 'hangul (font-spec :name "D2Coding") frame)))

(set-hangul-font)
(add-hook 'after-make-frame-functions 'set-hangul-font)

;; Default encoding for processes (in WSL, it is nil)
(add-to-list 'process-coding-system-alist '(utf-8-unix . utf-8-unix))


;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html

      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; no bell
(setq ring-bell-function 'ignore)

;;(load-theme 'challenger-deep t)
;; (require 'twilight-bright-theme)

(load-theme 'dracula t)
