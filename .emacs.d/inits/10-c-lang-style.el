(when (require 'cc-mode nil t)

  ;;
  ;; 
  (defun add-c-mode-conf ()
    (c-set-style "cc-mode")
    (setq indent-tabs-mode t) ; ハードタブ
    (setq c-basic-offset 8) ;; + のインデント幅を8にする

    ;; extern "C" { *** }
    (c-set-offset 'extern-lang-open 0)
    (c-set-offset 'inextern-lang 0)
    (c-set-offset 'extern-lang-close 0)

    ;; ラベル
    ;; *** :
    (c-set-offset 'label 0)

    ;; 式の途中で改行した時
    ;; hoge =
    ;;   *** ;
    (c-set-offset 'statement-cont '+)

    ;; 予約後など，C++のトップレベルの文字列の後
    ;; int
    ;;   ***
    (c-set-offset 'topmost-intro 0)
    (c-set-offset 'topmost-intro-cont '+)

    ;; 名前空間
    ;; namespace { *** }
    (c-set-offset 'namespace-open 0)
    (c-set-offset 'innamespace '0)
    (c-set-offset 'namespace-close 0)

    ;; 関数内部
    ;; int main(void){***}
    (c-set-offset 'defun-open 0)
    (c-set-offset 'defun-block-intro '+)
    (c-set-offset 'defun-close 0)

    ;; }で終わる式
    ;; enum {***}; etc.
    (c-set-offset 'block-open 0)
    (c-set-offset 'statement-block-intro '+)
    (c-set-offset 'block-close 0)
    )

  ;;
  ;; C Language
  (add-hook 'c-mode-common-hook 'add-c-mode-conf)

  ;;
  ;; C++ Language
  (add-hook 'c++-mode-common-hook 'add-c-mode-conf)
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
  )
