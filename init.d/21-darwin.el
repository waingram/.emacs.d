;; Set up OS X 

(if (eq system-type 'darwin)
(
	;; Homebrew
	(setq brew-prefix-coreutils-gbin "/usr/local/opt/coreutils/libexec/gnubin")
	(setq brew-prefix "/usr/local")
	(setq separator ":")

	(if (not (getenv "TERM_PROGRAM"))
	       (setenv "PATH"
	               (concat
	                (eval brew-prefix-coreutils-gbin)
	                (concat separator brew-prefix "/bin")
	                (concat separator brew-prefix "/sbin")
	                (shell-command-to-string "printf $PATH"))))

	;; Font
	;; (custom-set-faces
	;;  '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 114 :width normal :foundry "outline" :family "Ubuntu Mono")))))

        (custom-set-faces
         '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))


)	;; end if darwin
)
  
