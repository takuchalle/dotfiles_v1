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

(require 'cask "~/.cask/cask.el")
(defconst cask-bundle (cask-initialize))

(when (require 'init-loader nil t)
  (init-loader-load "~/.emacs.d/inits"))

