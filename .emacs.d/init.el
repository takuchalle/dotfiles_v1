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
        (expand-file-name "~/.emacs.d/elisp/auto-complete/")
        (expand-file-name "~/.emacs.d/elisp/ruby/")
        )
       load-path))

(when (require 'package nil t)
  ;; パッケージリポジトリの追加
  (add-to-list 'package-archives '("marmalade". "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA". "http://tromey.com/elpa/"))
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize))

(when (require 'init-loader nil t)
  (init-loader-load "~/.emacs.d/inits"))

;; install-elisp の設定
(when (require 'install-elisp nil t)
  (setq install-elisp-repository-directory "~/.emacs.d/elisp/"))

;;============iswitchb-mode========================================
;; バッファの切り替えを強化する
(iswitchb-mode 1)
;;; C-f, C-b, C-n, C-p で候補を切り替えることができるように。
(add-hook 'iswitchb-define-mode-map-hook
	        (lambda ()
		  (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
		  (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
		  (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
		  (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))

;; バッファ読み込み関数をiswitchb にする
(setq read-buffer-function 'iswitchb-read-buffer)
;; 部分文字列の代わりに正規表現を使う場合は t を設定する
(setq iswitchb-regexp nil)
;; 新しいバッファを作成するときにいちいち聞いてこない
(setq iswitchb-prompt-newbuffer nil)
;;============iswitchb-mode=======================================

;; C-u で別のウィンドウに移動
(global-set-key "\C-u" 'other-window)

;; 起動時に余計な表示をさせない
(if (not (<= emacs-major-version 23))
    (setq inhibit-startup-message t)
  (setq inhibit-startup-screen t))

;; TABの表示幅8
(setq-default tab-width 8)
;; インデントでタブ文字を使用する
(setq-default indent-tabs-mode t)


(defun count-lines-and-chars ()
  (if mark-active
      (format "[%dL%dw%dc]"
	      (count-lines (region-beginning) (region-end))
	      (how-many "[^
]+" (region-beginning) (region-end))
;              (how-many "\\w+" (region-beginning) (region-end))
	      (- (region-end) (region-beginning)))
    ""))
(add-to-list 'default-mode-line-format
	     '(:eval (count-lines-and-chars)))

;; ファイル名を取得する
(defun file-name-insert (arg)
    (interactive "p")
    (insert (file-name-nondirectory buffer-file-name)))
