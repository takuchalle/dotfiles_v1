;;; -*-Emacs-Lisp-*-
;;; 
;;; (setq debug-on-error t)

;;; add load-path
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/")
        (expand-file-name "~/.emacs.d/elisp/")
        (expand-file-name "~/.emacs.d/elisp/color-theme-6.6.0/")
        )
       load-path))

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

;; install-elisp の設定
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;;============iswitchb-mode========================================
;; バッファの切り替えを強化する
(iswitchb-mode 1)
;; バッファ読み込み関数をiswitchb にする
(setq read-buffer-function 'iswitchb-read-buffer)
;; 部分文字列の代わりに正規表現を使う場合は t を設定する
(setq iswitchb-regexp nil)
;; 新しいバッファを作成するときにいちいち聞いてこない
(setq iswitchb-prompt-newbuffer nil)
;;============iswitchb-mode=======================================

;; C-k で改行までkillする
(setq kill-whole-line t)

;; C-u で別のウィンドウに移動
(global-set-key "\C-u" 'other-window)

;; 
(if (not (<= emacs-major-version 23))
    (setq inhibit-startup-message t)
  (setq inhibit-startup-screen t))

;; TABの表示幅4
(setq-default tab-width 4)
;; インデントでタブ文字を使用しない
(setq-default indent-tabs-mode nil)

;; 色の設定
(when (require 'color-theme nil t)
  (color-theme-initialize)
  (color-theme-hober))

;; 対応する括弧をハイライト
(show-paren-mode t)

(load "coding.el")
(load "coding-style.el")
(load "skk-setting.el")
(load "my-ruby.el")

