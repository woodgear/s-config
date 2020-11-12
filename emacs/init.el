(defun hello ()
  "display hello world in echo area to indicate that you are load the init.el"
  (interactive)
  (message "hello emacs prepare ok now.")
  )

(defun open-config-file ()
(interactive)
  (find-file "~/.emacs.d/init.el")
  )

;; init straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; init straight over

(straight-use-package 'evil)
(straight-use-package 'winum)
(straight-use-package 'lsp-mode)
(straight-use-package 'keyfreq)


(require 'evil)
(evil-mode 1)

(require 'winum)
(winum-mode)


(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)


;; 其他配置
;; 允许emacs follow symlinks
(setq vc-follow-symlinks nil)


(hello)
