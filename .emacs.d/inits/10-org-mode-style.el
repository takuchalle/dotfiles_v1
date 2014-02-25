;; org-modeの初期化
(when (require 'org-install nil t)
  ;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  ;; キーバインドの設定
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-cr" 'org-remember)
  ;; org-modeでの強調表示を可能にする
  (add-hook 'org-mode-hook 'turn-on-font-lock)
  ;; 見出しの余分な*を消す
  (setq org-hide-leading-stars t)

  ;; TODO状態
  (setq org-todo-keywords
	'((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "SOMEDAY(s)")))
  ;; DONEの時刻を記録
  (setq org-log-done 'time)
  )
