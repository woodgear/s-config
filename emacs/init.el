;; hide welcome page
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)

;; hide top tool-bar
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)
(setq vc-follow-symlinks t)
(defun say-hi()
  "display hello world in echo area to indicate that you are load the init.el"
  (interactive)
  (message "hello world")
  )

(defun edit-config-file-in-current-window()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

(defun reload-config-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el") ) 

;; showcase of how to use alias
(defalias 'rcf 'reload-config-file)
(defalias 'get-current-mode 'describe-mode)



; ; load package manager, add the Melpa package registry
(require 'package)

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))


(package-initialize)
;; 使用escape 退出正常的minibuffer
(global-set-key [escape] 'keyboard-escape-quit)  

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(use-package keyfreq
  :ensure t
  :init
 (setq keyfreq-excluded-commands
      '(self-insert-command
        forward-char
        backward-char
        previous-line
        next-line))
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  )

;; evil mode
(use-package evil
  :ensure t
  :defer .1 
  :init  :config
  (evil-mode)
  (message "load evil ok")
)

;; 窗口导航要素
(use-package winum
  :ensure t
  :defer .1 
  :init
  (setq winum-keymap
    (let ((map (make-sparse-keymap)))
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
  (message "load winnum ok")
)


(use-package counsel
  :ensure t
  :hook (ivy-mode . counsel-mode)
  :bind (([remap evil-show-registers] . counsel-evil-registers)
         ([remap evil-show-marks]     . counsel-evil-marks)
         ([remap evil-show-jumps]     . evil-jump-list)
         ([remap recentf-open-files]  . counsel-recentf)
         ([remap swiper]              . counsel-grep-or-swiper))
  :config
  ;; use escape to exit ivy minibuffer
  (define-key ivy-minibuffer-map [escape] 'minibuffer-keyboard-quit)
)

;; init my custom shortcut
(use-package general
  :ensure t
)

(general-create-definer my-comma-leader-def
:prefix ","
:states '(normal visual))

(my-comma-leader-def
  ;; {{ window move 窗口移动系列家族
  "wh" 'evil-window-left
  "wl" 'evil-window-right
  "wk" 'evil-window-up
  "wj" 'evil-window-down
  ;; }}
  ;; 搜索所有可用的action
  "xm" 'counsel-M-x
  ;; 注释
  "ci"'comment-region
)

;; init some lsp relate stuff


;; some other config
;; 在modeline里显示行号、列号以及当前文件的总字符数
(use-package simple
  :ensure nil
  :hook (after-init . (lambda ()
                         (line-number-mode)
                         (column-number-mode)
                         (size-indication-mode))))
