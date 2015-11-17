;; yasnippet の設定
;; Emacs のバージョンが24以上の時に有効

(when (>= emacs-major-version 24)
  (when (require 'yasnippet nil t)
    (when (require 'helm-c-yasnippet nil t)
      (setq helm-yas-space-match-any-greedy t)
      (global-set-key (kbd "C-c y") 'helm-yas-complete)
      ;; ~/.emacs.d/にsnippetsというフォルダを作っておきましょう
      (yas-load-directory "~/.emacs.d/snippets")
      (yas-load-directory (concat (cask-dependency-path cask-bundle 'yasnippet)
				  "/snippets"))
      (yas-global-mode 1)
      
      ;; 単語展開キーバインド (ver8.0から明記しないと機能しない)
      ;; (setqだとtermなどで干渉問題ありでした)
      ;; もちろんTAB以外でもOK 例えば "C-;"とか
      (custom-set-variables '(yas-trigger-key "C-;"))
      
      ;; 既存スニペットを挿入する
      (define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
      ;; 新規スニペットを作成するバッファを用意する
      (define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
      ;; 既存スニペットを閲覧・編集する
      (define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
      )
    )
  )
