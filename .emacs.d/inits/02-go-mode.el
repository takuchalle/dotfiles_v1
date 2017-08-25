(require 'go-mode nil t)
  
(add-hook `go-mode-hook (lambda()
			  (setq gofmt-command "goimports")
			  (add-hook 'before-save-hook 'gofmt-before-save)))
