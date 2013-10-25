;; ELPA setting
;; Emacs のバージョンが24以降の時に有効になる
(when (require 'package nil t)
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/"))
  (package-initialize)
  )

