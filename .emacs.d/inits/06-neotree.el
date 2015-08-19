(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; 隠しファイルをデフォルトで表示
(setq neo-show-hidden-files t)

;; neotree でファイルを新規作成した後、自動的にファイルを開く
(setq neo-create-file-auto-open t)

;; delete-other-window で neotree ウィンドウを消さない
(setq neo-persist-show t)

;; キーバインドをシンプルにする
(setq neo-keymap-style 'concise)

;; neotree ウィンドウを表示する毎に current file のあるディレクトリを表示する
(setq neo-smart-open t)

;; たぶんまだ動かない https://github.com/jaypei/emacs-neotree/issues/105
(setq neo-vc-integration '(face char))

;; popwin との共存
(when neo-persist-show
  (add-hook 'popwin:before-popup-hook
	    (lambda () (setq neo-persist-show nil)))
  (add-hook 'popwin:after-popup-hook
	    (lambda () (setq neo-persist-show t))))

