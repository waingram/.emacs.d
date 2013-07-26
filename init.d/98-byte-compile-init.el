;; Automatically compile and save init.el
(defun byte-compile-init-files (file)
  "Automatically compile FILE"
  (interactive)
  (save-restriction
    ;; Suppress the warning when you setq an undefined variable.
    (if (>= emacs-major-version 23)
        (setq byte-compile-warnings '(not free-vars obsolete))
      (setq byte-compile-warnings '(unresolved callargs redefine obsolete noruntime cl-warnings interactive-only)))
    (byte-compile-file (expand-file-name file))))

(add-hook 'after-save-hook
          (function (lambda ()
                      (if (string= (file-truename (expand-file-name "~/.emacs.d/init.el"))
                                   (file-truename (buffer-file-name)))
                          (byte-compile-init-files "~/.emacs.d/init.el")))))

;; Byte-compile again who init.elc If it is older than init.el.
(if (file-newer-than-file-p (expand-file-name "~/.emacs.d/init.el")
                            (expand-file-name "~/.emacs.d/init.elc"))
    (byte-compile-init-files "~/.emacs.d/init.el"))

;; Byte-compile the rest of the init files
(dolist (file (directory-files wai-emacs-init-dir t "\\.el$"))
  (setq filename (file-name-sans-extension file))
  (setq fel (expand-file-name (concat filename ".el") wai-emacs-init-dir))
  (setq felc (expand-file-name (concat filename ".elc") wai-emacs-init-dir))

  (add-hook 'after-save-hook
            (function (lambda ()
                        (if (string= (file-truename fel)
                                     (file-truename buffer-file-name))
                            (byte-compile-init-files fel)))))

  ;; Byte-compile again who init.elc If it is older than init.el.
  (if (file-newer-than-file-p fel felc)
      (byte-compile-init-files fel)))




