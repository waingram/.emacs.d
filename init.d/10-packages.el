(require 'package)
(add-to-list 'package-archives
            '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
            '("ELPA" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (null package-archive-contents)
  (package-refresh-contents))

(package-initialize)

(defvar my-packages '(
                      ;; Auto-complete
                      auto-complete
                      fuzzy
                      ;; Ruby
                      rvm
                      ;; enh-ruby-mode
                      ;; inf-ruby-mode
                      haml-mode
                      ruby-tools
                      rspec-mode
                      ruby-block
                      ruby-end
                      ruby-interpolation
                      yaml-mode
                      ;; SCM
                      gh
                      gist
                      magit
                      ;; LISP
                      paredit
                      ;; Misc
                      auto-indent-mode
                      color-theme
                      cygwin-mount
                      dired+
                      eieio
                      find-file-in-project
                      idle-highlight-mode
                      ido-ubiquitous
                      json
                      markdown-mode
                      multi-term
                      org
                      rainbow-delimiters
                      smex
                      xml-rpc))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
