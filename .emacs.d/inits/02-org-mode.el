(when (>= emacs-major-version 23)
  (require 'org)
  
  ;; TODO
  (setq org-use-fast-todo-selection t)
  (setq org-todo-keywords
	'((sequence "TODO(t)" "STARTED(s)" "WAIT(w)" "|" "DONE(d)""CANCEL(c)")
	  (sequence "APPT(a)" "|" "DONE" "CANCEL(c)")))
  (setq org-log-done 'time)

  
  )
