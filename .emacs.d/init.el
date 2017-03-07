;;; -*-Emacs-Lisp-*-
;;; 
;;; (setq debug-on-error t)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(dolist (dir '("site-lisp"))
  (add-to-list 'load-path (concat user-emacs-directory dir)))

(let ((secret (concat user-emacs-directory ".secrets.el")))
  (when (file-exists-p secret)
        (load-file secret)))

;; package.el ;;
(require 'package)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(package-refresh-contents)

(package-install 'ace-isearch)
(package-install 'bind-key)
(package-install 'cmake-mode)
(package-install 'dash)
(package-install 'drag-stuff)
(package-install 'exec-path-from-shell)
(package-install 'expand-region)
(package-install 'f)
(package-install 'goto-chg)
(package-install 'htmlize)
(package-install 'idle-highlight-mode)
(package-install 'magit)
(package-install 'migemo)
(package-install 'multiple-cursors)
(package-install 'pallet)
(package-install 'popwin)
(package-install 'prodigy)
(package-install 'projectile)
(package-install 's)
(package-install 'smartparens)
(package-install 'smex)
(package-install 'use-package)
(package-install 'yasnippet)
(package-install 'helm)
(package-install 'helm-ag)
(package-install 'helm-c-yasnippet)
(package-install 'helm-gtags)
(package-install 'helm-swoop)
(package-install 'helm-migemo)
(package-install 'highlight-symbol)
(package-install 'rainbow-delimiters)
(package-install 'init-loader)
(package-install 'ninja-mode)
(package-install 'markdown-mode)
(package-install 'mwim)
(package-install 'epl)
(package-install 'color-theme)
(package-install 'color-theme-solarized)
(package-install 'recentf-ext)
(package-install 'auto-save-buffers-enhanced)
(package-install 'dropdown-list)
(package-install 'company)
(package-install 'company-quickhelp)
(package-install 'company-irony)
(package-install 'irony)
(package-install 'yaml-mode)
(package-install 'go-mode)

(when (require 'init-loader nil t)
  (init-loader-load "~/.emacs.d/inits"))

;;
;; migemo
;;
;; How to install
;; (cygwin) http://keisanbutsuriya.hateblo.jp/entry/2015/02/16/133658
(when (executable-find "cmigemo")
  (when (require 'migemo nil t)
    (setq migemo-command "cmigemo")
    (setq migemo-options '("-q" "--emacs"))
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
    (setq migemo-user-dictionary nil)
    (setq migemo-regex-dictionary nil)
    (setq migemo-coding-system 'utf-8-unix)
    (load-library "migemo")
    (migemo-init)))

;;
;; cmake-mode
;;
(when (require 'cmake-mode nil t)
  (add-hook 'cmake-mode-hook (lambda()
			       (company-mode))))

;;
;; ace-isearch
;;
;; (global-ace-isearch-mode 1)

;;
;; helm-swoop
;;
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)

;;
;; goto-chg
;;
(global-set-key (kbd "<f8>") 'goto-last-change)
(global-set-key (kbd "<M-f8>") 'goto-last-change-reverse)

;;
;; magit
;; https://magit.vc/
(when (require 'magit nil t)
  (global-set-key (kbd "C-x g") 'magit-status)

  (custom-set-faces
   '(magit-diff-added ((t (:background "black" :foreground "green"))))
   '(magit-diff-added-highlight ((t (:background "white" :foreground "gold"))))
   '(magit-diff-removed ((t (:background "black" :foreground "blue"))))
   '(magit-diff-removed-hightlight ((t (:background "white" :foreground "blue"))))
   '(magit-hash ((t (:foreground "red"))))
   )
  )

;;
;; mwin
;; http://emacs.rubikitch.com/mwim/
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") 'mwim-end-of-code-or-line)

;; hilight current cursor
(global-hl-line-mode)
