(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/elisp/skk")
        )
       load-path))

(when (require 'skk-autoloads nil t)
  (global-set-key "\C-x\C-j" 'skk-mode)
  (global-set-key "\C-xj" 'skk-auto-fill-mode)
  (global-set-key "\C-xt" 'skk-tutorial)
  
  (setq skk-large-jisyo "~/.emacs.d/elisp/skk/SKK-JISYO.L")

  (autoload 'skk-isearch-mode-setup "skk-isearch" nil t)
  (autoload 'skk-isearch-mode-cleanup "skk-isearch" nil t)
  (add-hook 'isearch-mode-hook
	    (function (lambda ()
			(and (boundp 'skk-mode) skk-mode
			     (skk-isearch-mode-setup) ))))
  (add-hook 'isearch-mode-end-hook
	    (function (lambda ()
			(and (boundp 'skk-mode) skk-mode
			     (skk-isearch-mode-cleanup)
			     (skk-set-cursor-properly) )))))
  

