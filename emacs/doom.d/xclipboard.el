;; copy from https://github.com/rolandwalker/simpleclip/issues/6#issuecomment-333714700

; x-clip support for emacs-nox / emacs-nw
(defun copy-to-xclipboard(arg)
  (interactive "P")
  (cond
    ((not (use-region-p))
      (message "Nothing to yank to X-clipboard"))
    ((and (not (display-graphic-p))
          (/= 0 (shell-command-on-region
                  (region-beginning) (region-end) "xsel -i -b")))
      (error "Is program `xsel' installed?"))
    (t
      (when (display-graphic-p)
        (call-interactively 'clipboard-kill-ring-save))
      (message "Yanked region to X-clipboard")
      (when arg
        (kill-region  (region-beginning) (region-end)))
      (deactivate-mark))))

(defun cut-to-xclipboard()
  (interactive)
  (my-copy-to-xclipboard t))

(defun paste-from-xclipboard()
  "Uses shell command `xsel -o' to paste from x-clipboard. With
one prefix arg, pastes from X-PRIMARY, and with two prefix args,
pastes from X-SECONDARY."
  (interactive)
  (if (display-graphic-p)
    (clipboard-yank)
    (let*
      ((opt (prefix-numeric-value current-prefix-arg))
      (opt (cond
        ((=  1 opt) "b")
        ((=  4 opt) "p")
        ((= 16 opt) "s"))))
    (insert (shell-command-to-string (concat "xsel -o -" opt))))))
