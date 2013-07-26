;; Emacs daemon mode

;; open in the same frame
(setq ns-pop-up-frames nil)

; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))

;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
)

;; make new frame visible when connecting via emacsclient
(add-hook 'server-switch-hook 'raise-frame)
