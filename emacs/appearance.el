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
(set-face-attribute 'default (selected-frame) :height 220)
