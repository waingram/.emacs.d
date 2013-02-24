; Keyboard Bindings

;; Running in server mode - never want to quit
(global-unset-key (kbd "C-x C-c")) 
(global-unset-key (kbd "s-q"))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

;; Kill the buffer instead of quitting
(global-set-key (kbd "C-x C-c") 'save-buffers-kill-terminal)
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)

;; Make things easier
(global-set-key (kbd "<f6>") 'magit-status)

;; Expansion
(global-set-key (kbd "M-/") 'hippie-expand)
