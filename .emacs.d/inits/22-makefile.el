(add-to-list 'auto-mode-alist '("\\.mk$" . makefile-gmake-mode))

(add-hook 'makefile-gmake-mode-hook
	  (function
	   (lambda ()
	     (fset 'makefile-warn-suspicious-lines 'ignore))))







