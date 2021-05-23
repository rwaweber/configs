(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; The value is in 1/10pt, so 100 will give you 10pt
(set-face-attribute 'default nil :height 220)
(tool-bar-mode -1)
(show-paren-mode 1)

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
(setq package-list
      '(evil))

;; install missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'evil)
