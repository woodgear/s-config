(setq user-full-name "wucong"
      user-mail-address "1875486458@qq.com")
(setq doom-theme 'doom-one)

;; 显示行号
(setq display-line-numbers-type t)

;; 配置winnum l-panel-focus-jump
(use-package! winum
  :init
  ;; 使用Alt+0-9 直接切换window
  (setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
      (define-key map (kbd "M-1") 'winum-select-window-1)
      (define-key map (kbd "M-2") 'winum-select-window-2)
      (define-key map (kbd "M-3") 'winum-select-window-3)
      (define-key map (kbd "M-4") 'winum-select-window-4)
      (define-key map (kbd "M-5") 'winum-select-window-5)
      (define-key map (kbd "M-6") 'winum-select-window-6)
      (define-key map (kbd "M-7") 'winum-select-window-7)
      (define-key map (kbd "M-8") 'winum-select-window-8)
      map))

  :config
  (winum-mode)
)

;; 使用xsel 提供如下三条命令
;; paste-from-xclipboard
;; cut-from-xclipboard
;; copy-to-xclipboard
(load "~/.doom.d/xclipboard.el")

;; 绑定显示所有命令到 ',,'
(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd ", ,") 'execute-extended-command))
