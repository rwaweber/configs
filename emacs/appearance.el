;; Maximize emacs window to screen.
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; Always snap to help window. Makes it easily closeable with "q".
(setq help-window-select t)

;; Set built-in dark theme.
(load-theme 'wombat 1)

;; Disable emacs toolbar.
(tool-bar-mode -1)

;; Set default font size pretty large, defer more specific
;; font settings/faces to hooks.el
(set-face-attribute 'default (selected-frame) :height 160)

;; The limit of the window width.
;; If `window-width' is smaller than the limit, some information won't be displayed.
(setq doom-modeline-hud t)
(setq doom-modeline-modal-icon nil)
(setq evil-normal-state-tag   (propertize "[Normal]" 'face '((:background "green" :foreground "black")))
      evil-emacs-state-tag    (propertize "[Emacs]" 'face '((:background "orange" :foreground "black")))
      evil-insert-state-tag   (propertize "[Insert]" 'face '((:background "red") :foreground "white"))
      evil-motion-state-tag   (propertize "[Motion]" 'face '((:background "blue") :foreground "white"))
      evil-visual-state-tag   (propertize "[Visual]" 'face '((:background "grey80" :foreground "black")))
      evil-operator-state-tag (propertize "[Operator]" 'face '((:background "purple"))))

;; Column numbers in modeline
(column-number-mode t)

