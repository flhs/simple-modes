(require 'xcscope)

(defun c-tab ()
  (interactive)
  (insert-char ?\t))

(defvar c-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "TAB") 'c-tab)
    map))

(add-to-list 'auto-mode-alist '("\\.[ch]\\'" . c-mode))

(defun c-mode ()
  (interactive)
  (kill-all-local-variables)
  (cscope-minor-mode)
  (use-local-map c-mode-map)
  (set (make-local-variable 'tab-width) 8)
  (set (make-local-variable 'comment-start) "/* ")
  (set (make-local-variable 'comment-start) " */")
  (set (make-local-variable 'comment-start-skip) "\\(//+\\|/\\*+\\)\\s *")
  (set (make-local-variable 'require-final-newline) t)
  (setq major-mode 'c-mode)
  (setq mode-name "c"))

(provide 'c-mode)
