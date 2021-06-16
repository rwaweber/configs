;; Package repositories
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

;; Refresh package lists
(unless package-archive-contents
  (package-refresh-contents))

;; Packages to install
(package-initialize)
(setq packages-to-install
      '(cider
	clojure-mode
	company
	doom-modeline
	eshell-git-prompt
	evil
	evil-surround
	evil-cleverparens
	exec-path-from-shell
	flycheck
	go-mode
	helm
	lsp-mode
	lsp-pyright
	lsp-treemacs
	lsp-ui
	magit
	org
	treemacs
	treemacs-evil))
;; Install clojure-lsp manually

;; Install missing packages
(dolist (package packages-to-install)
  (unless (package-installed-p package)
    (package-install package)))
