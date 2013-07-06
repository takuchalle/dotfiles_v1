(when (require 'auto-install nil t)
  ;; インストールディレクトリを設定
  (setq auto-install-directory "~/.emacs.d/elisp/")

  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))
