;;
;; 
(defun add-c-mode-conf ()
  (c-set-style "cc-mode")
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8)
  (c-set-offset 'innamespace 0)
  )

;;
;; C Language
(add-hook 'c-mode-common-hook 'add-c-mode-conf)

;;
;; C++ Language
(add-hook 'c++-mode-common-hook 'add-c-mode-conf)

