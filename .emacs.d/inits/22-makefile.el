(add-hook 'makefile-mode-hook
	  (function
	   (lambda ()
	     (fset 'makefile-warn-suspicious-lines 'ignore))))
