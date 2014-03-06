;; 参考URL
;; http://d.hatena.ne.jp/a_bicky/20140104/1388822688
;; http://d.hatena.ne.jp/a_bicky/20140125/1390647299
(when (require 'helm-config nil t)
  (helm-mode 1)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x C-r") 'helm-recentf)
  (define-key global-map (kbd "M-y")     'helm-show-kill-ring)
  (define-key global-map (kbd "C-c i")   'helm-imenu)
  (define-key global-map (kbd "C-x b")   'helm-buffers-list)

  ; helm-occurの起動
  (global-set-key (kbd "C-M-o") 'helm-occur)
  ; isearchからhelm-occurを起動
  (define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)
  ; helm-occurからall-extに受け渡し
  (define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur)
  
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

  ;; Emulate `kill-line' in helm minibuffer
  (setq helm-delete-minibuffer-contents-from-point t)
  (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))
  )
