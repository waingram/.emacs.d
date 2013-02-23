; Set up cygwin stuff if needed

(if (eq system-type 'windows-nt)
    (load (expand-file-name "setup-cygwin.el" wai-emacs-conf-dir)))
