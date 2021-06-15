;; Create two different sets of hooks for prose and code.
(defun prose-hook()
  (interactive)
  (setq buffer-face-mode-face '(:family "Avenir" :height 220))
  (buffer-face-mode))

(defun dev-hook()
  (linum-mode 1)
  (global-company-mode)
  (local-set-key (kbd "M-TAB") #'company-complete)
  (interactive)
  (setq buffer-face-mode-face '(:family "Fantasque Sans Mono" :height 150))
  (require 'lsp-mode)
  (buffer-face-mode))

;; Org-mode setting
(add-hook 'org-mode-hook 'prose-hook)

;; Emacs-lisp settings
(add-hook 'emacs-lisp-mode-hook (lambda ()
                  (evil-cleverparens-mode)
                  (dev-hook)))

;; Python settings
(add-hook 'python-mode-hook (lambda ()
                  (dev-hook)
                  (require 'lsp-pyright)
                              (lsp)))

;; Clojure settings
(add-hook 'clojure-mode-hook (lambda ()
                   (evil-cleverparens-mode)
                   (dev-hook)
                               (lsp)))

(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)

;; Go settings
(add-hook 'go-mode-hook #'lsp-deferred)

;;; Set up before-save hooks to format buffer and add/delete imports.
;;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook (lambda ()
              (dev-hook)
              (lsp-go-install-save-hooks)
              (lsp-deferred)))
