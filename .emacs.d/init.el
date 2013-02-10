;;; -*-Emacs-Lisp-*-
;;; 
;;; (setq debug-on-error t)

;;; add load-path
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(setq load-path (cons "~/.emacs.d/elisp/color-theme-6.6.0" load-path))

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

;; If Teriminal, Menu bar disable
(when (eq window-system 'nil)
  (menu-bar-mode 0))

;; C-k で改行までkillする
(setq kill-whole-line t)

;; scratchのコメントを表示させない
(setq initial-scratch-message nil)

;; 
(if (not (<= emacs-major-version 23))
    (setq inhibit-startup-message t)
  (setq inhibit-startup-screen t))

;; モードラインに時刻を表示する
(display-time)

;; 行番号・桁番号を表示される
(line-number-mode t)
(column-number-mode t)

;; ファイルサイズを表示するl
(size-indication-mode t)

;; GCを減らして軽くする (デフォルトの10倍)
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; ctrl-h backspace
(keyboard-translate ?\C-h ?\C-?)

;; 改行時にインデントを行う
(global-set-key (kbd "C-m") 'newline-and-indent)

;; TABの表示幅4
(setq-default tab-width 4)
;; インデントでタブ文字を使用しない
(setq-default indent-tabs-mode nil)

;; 色の設定
(when (require 'color-theme nil t)
  (color-theme-initialize)
  (color-theme-hober))

;; 対応する括弧をハイライト



(load "coding.el")
(load "coding-style.el")
(load "skk-setting.el")
