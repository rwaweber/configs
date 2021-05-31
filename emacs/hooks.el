;; Create two different sets of hooks for prose and code.
(defun prose-hook()
  (interactive)
  (setq buffer-face-mode-face '(:family "Avenir" :height 220))
  (buffer-face-mode))

(defun dev-hook()
  (linum-mode 1)
  (interactive)
  (setq buffer-face-mode-face '(:family "Fantasque Sans Mono" :height 150))
  (buffer-face-mode))

(add-hook 'emacs-lisp-mode-hook 'evil-cleverparens-mode)
(add-hook 'emacs-lisp-mode-hook 'dev-hook)
(add-hook 'python-mode-hook 'dev-hook)
(add-hook 'org-mode-hook 'prose-hook)
