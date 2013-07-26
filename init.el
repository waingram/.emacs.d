;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs config						     ;;
;; ============                                              ;;
;;                                                           ;;
;; Author: <a href="http://bill-ingram.com/">Bill Ingram</a> ;;
;; Last Modified: Tue Feb 19 21:33:15 CST 2013		     ;;
;; 							     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Fix NTFS backslashes
(defun normalize-slashes (pathname)
  "Reverse NTFS backslashes in PATHNAME to be Unix slashes; get rid of doubles"
  (replace-regexp-in-string "//" "/" (replace-regexp-in-string "\\\\" "/" pathname)))

;; (add-to-list 'load-path (normalize-slashes (getenv "HOME")))

;; -- we might want to debug
(setq debug-on-error 0)

;; Set some directories
(setq wai-emacs-init-file load-file-name)
(setq wai-emacs-home-dir (file-name-directory wai-emacs-init-file))
(setq user-emacs-directory wai-emacs-home-dir)
(setq wai-elisp-dir (expand-file-name "elisp" wai-emacs-home-dir))
(setq wai-elisp-external-dir (expand-file-name "external" wai-elisp-dir))
(setq wai-emacs-init-dir (expand-file-name "init.d" wai-emacs-home-dir))
(setq wai-emacs-lib-dir (expand-file-name "lib" wai-emacs-home-dir))

;; Add my personal elisp directory to load path
(add-to-list 'load-path wai-elisp-dir)

;; Set up 'custom' system
(setq custom-file (expand-file-name "11-custom.el" wai-emacs-init-dir))

;; Load all elisp files in ./init.d
(if (file-exists-p wai-emacs-init-dir)
    (dolist (file (directory-files wai-emacs-init-dir t "\\.el$"))
      (load file)))

;; Set up backup directory
(setq backup-by-copying t
      backup-directory-alist
      (list (cons "." (expand-file-name "backups" user-emacs-directory)))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      ;; Make backup files even when they're in version control
      vc-make-backup-files t)

;; Autosave settings
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "autosaves/\\1") t)))

;; Create auto-save-list directory if doesn't exist yet
;; as its lack causes errors while auto saving is performed.
(let ((auto-save-list-dir (expand-file-name "auto-save-list" user-emacs-directory)))
  (unless (file-exists-p auto-save-list-dir)
    (make-directory auto-save-list-dir)))

;; Secrets
(setq wai-secrets-file (expand-file-name "secrets.el" wai-emacs-lib-dir))
(when (file-exists-p wai-secrets-file)(load wai-secrets-file))

;; Add external projects to load path
(dolist (project (directory-files wai-elisp-external-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))
