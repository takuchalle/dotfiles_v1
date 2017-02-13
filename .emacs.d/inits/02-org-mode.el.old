(when (>= emacs-major-version 23)
  (when (require 'org nil t)
    (require 'org-install)
    
    (define-key global-map "\C-cl" 'org-store-link)
    (define-key global-map "\C-ca" 'org-agenda)
    (define-key global-map "\C-cr" 'org-remember)
    
    ;; TODO
    (setq org-use-fast-todo-selection t)
    (setq org-todo-keywords
	  '((sequence "TODO(t)" "STARTED(s)" "WAIT(w)" "|" "DONE(d)""CANCEL(c)")
	    (sequence "APPT(a)" "|" "DONE" "CANCEL(c)")))
    (setq org-log-done 'time)
    ))
