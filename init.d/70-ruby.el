;; ruby-end
(require 'ruby-end)

;; ruby-tools
(require 'ruby-tools)

;; Load my copy of starter-kit-ruby.el
;; I don't want the whole starter-kit package, which would be
;; installed as a dependency if I used package manager for this
(load (expand-file-name "starter-kit-ruby.el" wai-emacs-lib-dir))

;; ruby-hacks
(load (expand-file-name "ruby-hacks.el" wai-emacs-lib-dir))
