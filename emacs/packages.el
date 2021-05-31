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
    '(doom-modeline
      evil
      evil-surround
      evil-cleverparens
      exec-path-from-shell
      helm
      lsp-mode))

;; Install missing packages
(dolist (package packages-to-install)
  (unless (package-installed-p package)
    (package-install package)))
