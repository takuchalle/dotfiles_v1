(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

(setq interpreter-mode-alist
      (append '(("ruby" . ruby-mode)) interpreter-mode-alist))

(add-hook 'ruby-mode-hook
          '(lambda ()
	     (setq tab-width 4)
	     (setq ruby-indent-level tab-width)
	     ))

;; ruby-electric
(when (require 'ruby-electric nil t)
  (add-hook 'ruby-mode-hook
	    '(lambda () (ruby-electric-mode t)))
  (setq ruby-electric-expand-delimiters-list nil))

;; ruby-block
(when (require 'ruby-block nil t)
  (ruby-block-mode t)
  ;; ミニバッファに表示し, かつ, オーバレイする.
  (setq ruby-block-highlight-toggle t))

;; マジックコメントの自動挿入抑止
(setq ruby-insert-encoding-magic-comment nil)
