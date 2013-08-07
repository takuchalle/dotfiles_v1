(when (require 'gtags nil t)
  (setq gtags-prefix-key "\C-c")
  ;; キーバインド
  (setq gtags-mode-hook
	'(lambda ()
	   (define-key gtags-mode-map "\C-cs" 'gtags-find-symbol)
	   (define-key gtags-mode-map "\C-cr" 'gtags-find-rtag)
	   (define-key gtags-mode-map "\C-ct" 'gtags-find-tag)
	   ;; gtags-mode を使いたい mode の hook に追加する
	   (add-hook 'c-mode-common-hook
		     '(lambda()
			(gtags-mode 1)))(define-key gtags-mode-map "\C-cf" 'gtags-parse-file))))
