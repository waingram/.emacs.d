(ido-mode 1)

;; UTF-8 everywhere!!!
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)

;; Spaces for indentation
(setq-default indent-tabs-mode nil
              tab-width 4)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Sentences do not need double spaces to end.
(setq-default sentence-end-double-space nil)

;; Make edited files end with a carriage return
(setq require-final-newline t)

;; Do not break lines
(setq-default truncate-lines t)

;; Any key deletes selection
(delete-selection-mode 1)

;; Handle camelCase words properly everywhere
(global-subword-mode 1)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Revert buffers automatically associated with files when the file changes on disk
(global-auto-revert-mode 1)
;; Also auto refresh dired and be quiet
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

;; Hippie shit
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (adwaita)))
 '(default-frame-alist (quote ((top . 0) (left . 0) (width . 150) (height . 35))))
 '(ido-auto-merge-work-directories-length nil)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-enable-prefix nil)
 '(ido-handle-duplicate-virtual-buffers 2)
 '(ido-max-prospects 10)
 '(ido-mode (quote both) nil (ido))
 '(ido-ubiquitous-mode t)
 '(ido-use-filename-at-point (quote guess))
 '(ido-use-virtual-buffers t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(highlight-changes-mode t)
 '(initial-buffer-choice t)
 '(initial-frame-alist (quote ((top . 0) (left . 0) (width . 150) (height . 35))))
 '(initial-scratch-message ";; Old Scratch

")
 '(magit-process-connection-type nil)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/") ("ELPA" . "http://tromey.com/elpa/") ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Ubuntu Mono")))))
