;;; Load other files

;; Manage packages
(load-file (concat user-emacs-directory "/packages.el"))

;; Source PATH from system
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Manage appearance-specific settings
(load-file (concat user-emacs-directory "/appearance.el"))

;; Setup event triggers for emacs
(load-file (concat user-emacs-directory "/hooks.el"))

;; Create local, untracked custom-settings file to keep init.el clean
(setq custom-file (concat user-emacs-directory "/custom.el"))

;; Parentheses matching
(show-paren-mode 1)

;; Disable backups
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Enable evil mode
(require 'evil)
(require 'evil-surround)

(evil-mode 1)
(global-evil-surround-mode 1)

(require 'doom-modeline)
(doom-modeline-mode 1)

(require 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
