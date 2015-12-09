;; system-type predicates
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (eq window-system 'ns)
      carbon-p  (eq window-system 'mac)
      linux-p   (eq system-type 'gnu/linux)
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))

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
(global-set-key "\C-h" 'delete-backward-char)

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

;; find-file の補完で大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; magit
(when (require 'magit nil t))

;; dsvn
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

;; dired で開いているときに、 r を押してファイル/ディレクトリ名変更
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; recentf 強化
(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer
	(run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1)
  (require 'recentf-ext))

;; C-t/C-u で別のウィンドウに移動
(global-set-key "\C-t" 'other-window)
(global-set-key "\C-u" 'other-window)

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
(defun insert-file-name (arg)
    (interactive "p")
    (insert (file-name-nondirectory buffer-file-name)))

;; auto save
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 0.5) ;; 指定のアイドル秒で保存
(auto-save-buffers-enhanced t)
