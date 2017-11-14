;;; Code:
;; extras

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-file "$HOME/.emacs.d/packages-toload.el")
(load-file "$HOME/.emacs.d/appearance.el")
(load-file "$HOME/.emacs.d/shortcuts.el")
(load-file "$HOME/.emacs.d/venvs.el")
(load-file "$HOME/.emacs.d/go-autocomplete.el")
(load-file "$HOME/.emacs.d/exec-path-from-shell.el")

(add-to-list 'exec-path "$HOME/bin")
(require 'helm-config)

;; minimal emacs face
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
;; minimal window features

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Writing Hooks
(add-hook 'markdown-mode-hook 'composition-hook)
(defun composition-hook()
  (flyspell-mode 1))

(defun development-hook()
  (flycheck-mode 1)
  (linum-mode 1))

(defun go-hook()
  (development-hook)
  (global-set-key "\C-cd" 'godoc))

;; development
(global-set-key "\C-xb" 'helm-buffers-list)
(add-hook 'go-mode-hook 'go-hook)
(provide 'init)
;;; init.el ends here
