;;; packages-toload -- Summary:
;;; Commentary:
;; Emacs 'bundler' that will install packages from package-list on boot

(require 'package)
(setq package-archives '(
			 ("melpa" . "http://melpa.milkbox.net/packages/")
             ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)
(setq package-list '(
              auto-complete
		      beacon
		      cider
		      flycheck
              go-mode
		      helm
		      magit
		      markdown-mode
		      monokai-theme
		      virtualenvwrapper
              ))

;;; packages-toload.el ends here
;; fetch list of available packages
(unless package-archive-contents
  (package-refresh-contents))

;; install missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
;;
;; End Emacs 'bundling'
