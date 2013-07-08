;; if Teriminal, Menu bar disable
(when (eq window-system 'nil)
  (menu-bar-mode 0))

;; scratchのコメントを表示させない
(setq initial-scratch-message nil)

;; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;; モードラインに時刻を表示する
(display-time)

;; 行番号・桁番号を表示される
(line-number-mode t)
(column-number-mode t)

;; ファイルサイズを表示する
(size-indication-mode t)

;; GCを減らして軽くする (デフォルトの10倍)
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; ctrl-h backspace
(keyboard-translate ?\C-h ?\C-?)

;; 改行時にインデントを行う
(global-set-key (kbd "C-m") 'newline-and-indent)

;;yes-noの選択肢をy-nにする
(fset 'yes-or-no-p 'y-or-n-p)

;; Backup fileの場所指定
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/.backup"))
            backup-directory-alist))

;; "#!" から始まるファイルを保存する時に実行属性を付与する
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

;; 対応する括弧をハイライト
(show-paren-mode t)

;;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;;タブの代わりに半角スペースを使う
(setq-default tab-width 4 indent-tabs-mode nil)

;ログの記録行数を増やす
(setq message-log-max 10000)

;;;サーバ起動
(when (require 'server nil t)
  (unless (server-running-p)
    (server-start)))

;;自動再読み込み
(global-auto-revert-mode t)

(when (require 'uniquify nil t)
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

;;; debug用
(setq debug-on-error t)

;;; symlinkは必ず追いかける
(setq vc-follow-symlinks t)

;; C-x C-f の時、現在位置のファイルがデフォルトになる
(ffap-bindings)

;; ファイルを自動で保存する
;; (auto-install-from-url "https://raw.github.com/kentaro/auto-save-buffers-enhanced/master/auto-save-buffers-enhanced.el")
(when (require 'auto-save-buffers-enhanced nil t)
  (setq auto-save-buffers-enhanced-interval 1)
  (auto-save-buffers-enhanced t)
  )

