;; settings for Perl
(add-hook 'perl-mode-hook
          (lambda ()
            (setq tab-width 4
                  indent-tabs-mode nil)))
(add-hook 'cperl-mode-hook
          (lambda ()
            (setq tab-width 4
                  indent-tabs-mode nil)))

;; settings for Elisp
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

;; settings for C++
(add-hook 'c++-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

;; settings for HTML
(add-hook 'html-mode-hook
          (lambda ()
            (setq tab-width 2
                  indent-tabs-mode nil)))

;; settings for JavaScript
(add-hook 'javascript-mode-hook
          (lambda ()
            (setq tab-width 4
                  indent-tabs-mode nil)
            (setq javascript-indent-level 4)
            (setq javascript-basic-offset tab-width)))