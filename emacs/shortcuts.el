;; autoformatting full source
;; courtesy of willkill07
(defun format-source ()
  (interactive)
  (indent-region (point-min) (point-max) nil))

;; line mobility functions
(defun move-line-up ()
  (interactive)
  (transpose-lines 1 )
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

;; Line mobility
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

;; line manuevering
(global-set-key "\C-h[" 'beginning-of-line)
(global-set-key "\C-h]" 'end-of-line)


;; ctrl-c keybindings
(global-set-key "\C-c[" 'comment-region)
(global-set-key "\C-c]" 'uncomment-region)
(global-set-key "\C-cf" 'format-source)
