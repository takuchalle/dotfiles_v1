(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
  (ac-config-default))
