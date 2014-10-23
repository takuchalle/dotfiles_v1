(when (require 'popwin nil t)
  (setq display-buffer-function 'popwin:display-buffer)
  (when (require 'direx nil t)
    (setq direx:leaf-icon "  "
	  direx:open-icon "- "
	  direx:closed-icon "+ ")
    (push '(direx:direx-mode :position left :width 40 :dedicated t)
	  popwin:special-display-config)
    (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
    )
  )
