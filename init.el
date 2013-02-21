;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs config						     ;;
;; author: <a href="http://bill-ingram.com/">Bill Ingram</a> ;;
;; Last Modified: Tue Feb 19 21:33:15 CST 2013		     ;;
;; 							     ;;
;; playing along with Avdi's *Emacs Reboot*		     ;;
;; http://devblog.avdi.org/category/emacs-reboot	     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set up load path
(setq wai-emacs-init-file load-file-name)
(setq wai-emacs-config-dir
      (file-name-directory wai-emacs-init-file))

(setq user-emacs-directory wai-emacs-config-dir)

;; Some directories
(setq wai-elisp-dir (expand-file-name "elisp" wai-emacs-config-dir))
(setq wai-elisp-external-dir (expand-file-name "external" wai-elisp-dir))
(setq wai-init-dir (expand-file-name "init.d" wai-emacs-config-dir))

;; Load all elisp files in ./init.d
(if (file-exists-p wai-init-dir)
    (dolist (file (directory-files wai-init-dir t "\\.el$"))
      (load file)))

;; Add my personal elisp directory to load path
(add-to-list 'load-path wai-elisp-dir)
                                                                                                                                                                       
;; Add external projects to load path
(dolist (project (directory-files wai-elisp-external-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Set up backup directory 
(setq backup-directory-alist 
      (list (cons "." (expand-file-name "backup" user-emacs-directory))))

;; Set up 'custom' system
(setq custom-file (expand-file-name "emacs-customizations.el" wai-emacs-config-dir))
(load custom-file)

;; Secrets
(setq wai-secrets-file
      (expand-file-name "secrets.el" wai-emacs-config-dir))
(when (file-exists-p wai-secrets-file)
  (load wai-secrets-file))


