(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

(defun say-hi()
  "display hello world in echo area to indicate that you are load the init.el"
  (interactive)
  (message "hello world")
  )

(defun edit-config-file-in-current-window()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

;; (defun load-config-file ()
;;   (load-file "~/.emacs.d/init.el") ) 

;; 使用escape推出minibuffer
(with-eval-after-load 'evil
    (define-key ivy-minibuffer-map [escape] 'minibuffer-keyboard-quit))

;; load package manager, add the Melpa package registry
(require 'package)
(setq package-archives
        '(
          ("melpa"  . "https://melpa.org/packages/")
          ))
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

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
  :init
  :config
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

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode))

(use-package counsel
  :ensure t
  :hook (ivy-mode . counsel-mode)
  :bind (([remap evil-show-registers] . counsel-evil-registers)
         ([remap evil-show-marks]     . counsel-evil-marks)
         ([remap evil-show-jumps]     . evil-jump-list)
         ([remap recentf-open-files]  . counsel-recentf)
         ([remap swiper]              . counsel-grep-or-swiper))
)

(use-package swiper
  :ensure t
  :custom
  (swiper-action-recenter t))

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
  "," 'counsel-M-x
  ;; 注释
  "ci"'comment-region
)

;; init some lsp relate stuff

;; The completion engine
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :bind (:map company-mode-map
         ([remap completion-at-point] . company-complete)
         :map company-active-map
         ("C-/"     . counsel-company)
         ("C-p"     . company-select-previous)
         ("C-n"     . company-select-next)
         ("C-s"     . company-filter-candidates)
         ([tab]     . company-complete-common-or-cycle)
         ([backtab] . company-select-previous-or-abort)
         :map company-search-map
         ("C-p"    . company-select-previous)
         ("C-n"    . company-select-next))
  :custom
  (company-echo-delay 0)
  ;; Easy navigation to candidates with M-<n>
  (company-show-numbers t)
  (company-require-match nil)
  (company-minimum-prefix-length 3)
  (company-tooltip-width-grow-only t)
  (company-tooltip-align-annotations t)
  ;; complete `abbrev' only in current buffer
  (company-dabbrev-other-buffers nil)
  ;; make dabbrev case-sensitive
  (company-dabbrev-ignore-case nil)
  (company-dabbrev-downcase nil)
  ;; make dabbrev-code case-sensitive
  (company-dabbrev-code-ignore-case nil)
  (company-dabbrev-code-everywhere t)
  (company-backends '(company-capf
                      company-files
                      (company-dabbrev-code company-etags company-keywords)
                      company-dabbrev)))

;; lsp-mode
(use-package lsp-mode
  :ensure t
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (prog-mode . lsp-deferred))
  :custom
  (lsp-enable-links nil)                 ;; no clickable links
  (lsp-enable-folding nil)               ;; use `hideshow' instead
  (lsp-enable-snippet nil)               ;; no snippet
  (lsp-enable-file-watchers nil)         ;; turn off for better performance
  (lsp-enable-text-document-color nil)   ;; as above
  (lsp-enable-semantic-highlighting nil) ;; as above
  (lsp-enable-symbol-highlighting nil)   ;; as above
  (lsp-enable-indentation nil)           ;; indent by ourself
  (lsp-enable-on-type-formatting nil)    ;; disable formatting on the fly
  (lsp-modeline-code-actions-enable nil) ;; keep modeline clean
  (lsp-modeline-diagnostics-enable nil)  ;; as above
  (lsp-idle-delay 0.5)                   ;; lazy refresh
  (lsp-log-io nil)                       ;; enable log only for debug
  (lsp-diagnostics-provider :flycheck)   ;; prefer `flycheck'
  (lsp-lens-enable t)                    ;; enable lens
  (lsp-auto-guess-root t)                ;; auto guess root
  (lsp-keep-workspace-alive nil)         ;; auto kill lsp server
  (lsp-eldoc-enable-hover nil)           ;; disable eldoc hover
  (lsp-signature-auto-activate t)        ;; show function signature
  (lsp-signature-doc-lines 2))           ;; but dont take up more lines

;; Jump to workspace symbol
(use-package lsp-ivy
  :ensure t
  :commands my/lsp-ivy-workspace-symbol
  :config
  (defun my/lsp-ivy-workspace-symbol ()
    "A `lsp-ivy-workspace-symbol' wrapper that effective only in `lsp-mode'."
    (interactive)
    (when (bound-and-true-p lsp-mode)
      (call-interactively 'lsp-ivy-workspace-symbol))))

(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :config
  (with-eval-after-load 'exec-path-from-shell
    (exec-path-from-shell-copy-envs '("GOPATH" "GOPROXY")))
  :custom
  (godoc-reuse-buffer t))

(use-package elisp-mode
  :ensure nil
  :bind (:map emacs-lisp-mode-map
         ;; consistent with inferior-python-shell
         ("C-c C-p" . my/ielm-other-window)
         ("C-c C-b" . eval-buffer)
         ("C-c C-c" . eval-to-comment)
         :map lisp-interaction-mode-map
         ("C-c C-c" . eval-to-comment))
  :config
  (defconst eval-as-comment-prefix ";;=> ")

  ;; Imitate scala-mode
  ;; from https://github.com/dakra/dmacs
  (defun eval-to-comment (&optional arg)
    (interactive "P")
    (let ((start (point)))
      (eval-print-last-sexp arg)
      (save-excursion
        (goto-char start)
        (save-match-data
          (re-search-forward "[[:space:]\n]+" nil t)
          (insert eval-as-comment-prefix))))))

(use-package ielm
  :ensure nil
  :hook ((ielm-mode . my/buffer-auto-close)
         (ielm-mode . company-mode)))


(use-package rust-mode
  :ensure t
  :defines lsp-rust-server
  :mode ("\\.rs\\'" . rust-mode)
  :config
  ;; Prefer `rust-analyzer' over `rls'
  (with-eval-after-load 'lsp-mode
    (when (executable-find "rust-analyzer")
      (setq lsp-rust-server 'rust-analyzer)))
  :custom
  (rust-format-on-save (executable-find "rustfmt")))

;; Cargo integration
(use-package cargo
  :ensure t
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :ensure t
  :after rust-mode
  :hook (flycheck-mode . flycheck-rust-setup))
