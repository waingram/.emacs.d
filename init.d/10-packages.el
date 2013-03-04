(require 'package)
(add-to-list 'package-archives 
            '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
            '("ELPA" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))


(setq debug-on-error 1)

(defvar my-packages '(color-theme
                      cygwin-mount
                      dired+
                      eieio
                      haml-mode
                      gh
                      gist
                      json
                      magit
                      markdown-mode
                      multi-term
                      org
                      rainbow-delimiters
                      smex
                      xml-rpc))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
