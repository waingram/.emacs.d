;;; Program hooks
;;;
;;; Most code here taken from:starter-kit-defuns.el
;;; Author: Phil Hagelberg <technomancy@gmail.com>
;;; URL: http://www.emacswiki.org/cgi-bin/wiki/StarterKit
;;; Copyright (c) 2008-2010 Phil Hagelberg and contributors


(defun wai-local-column-number-mode ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t))

(defun wai-local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun wai-turn-on-hl-line-mode ()
  (when (> (display-color-cells) 8)
    (hl-line-mode t)))

(defun wai-turn-on-save-place-mode ()
  (require 'saveplace)
  (setq save-place t))

(defun wai-pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun wai-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|HACK\\|REFACTOR\\|NOCOMMIT\\)"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'wai-local-column-number-mode)
(add-hook 'prog-mode-hook 'wai-local-comment-auto-fill)
(add-hook 'prog-mode-hook 'wai-turn-on-hl-line-mode)
(add-hook 'prog-mode-hook 'wai-turn-on-save-place-mode)
(add-hook 'prog-mode-hook 'wai-pretty-lambdas)
(add-hook 'prog-mode-hook 'wai-add-watchwords)
(add-hook 'prog-mode-hook 'idle-highlight-mode)

;; Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Text mode
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'flyspell-mode)


(defun wai-prog-mode-hook ()
  (run-hooks 'prog-mode-hook))

(defun wai-turn-off-tool-bar ()
  (if (functionp 'tool-bar-mode) (tool-bar-mode -1)))

(defun wai-untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun wai-indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun wai-cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (wai-indent-buffer)
  (wai-untabify-buffer)
  (delete-trailing-whitespace))

;; Commands

(defun wai-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun wai-sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun wai-insert-date ()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

(defun wai-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))

;; A monkeypatch to cause annotate to ignore whitespace
;; (defun vc-git-annotate-command (file buf &optional rev)
;;   (let ((name (file-relative-name file)))
;;     (vc-git-command buf 0 name "blame" "-w" rev)))
