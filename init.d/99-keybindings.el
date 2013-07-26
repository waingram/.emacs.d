; Keyboard Bindings

;; Running in server mode - never want to quit
(global-unset-key (kbd "C-x C-c")) 
(global-unset-key (kbd "s-q"))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

;; Kill also emacs daemon if started
(global-set-key (kbd "C-x r q") 'save-buffers-kill-emacs)

;; Usual C-x C-c close frame only
(global-set-key (kbd "C-x C-c") 'delete-frame)
(global-set-key (kbd "s-q") 'delete-frame)

;; Hippie expand instead of dabbrev
(global-set-key (kbd "M-/") 'hippie-expand)
;; Expand line
(global-set-key (kbd "C-M-/") 'hippie-expand-lines)

;; Replace old M-x with smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; M-x without Meta
(global-set-key (kbd "C-x C-m") 'smex)

;; Browse kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Make things easier
(global-set-key (kbd "<f6>") 'magit-status)
(global-set-key (kbd "<f5>") 'eval-buffer)

;; Toggle Comments
(global-unset-key (kbd "C-/"))
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

;; Replace
(global-unset-key (kbd "C-r"))
(global-set-key (kbd "C-r") 'replace-string)
