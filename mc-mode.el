(defun mc-tab ()
  (interactive)
  (insert-char ?\t))

(defvar mc-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "TAB") 'mc-tab)
    map))

(add-to-list 'auto-mode-alist '("\\.[chy]\\'" . mc-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . mc-mode))
(add-to-list 'auto-mode-alist '("\\.hh\\'" . mc-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . mc-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . mc-mode))

(defun mc-mode ()
  (interactive)
  (kill-all-local-variables)
  (use-local-map mc-mode-map)
  (set (make-local-variable 'tab-width) 8)
  (set (make-local-variable 'comment-start) "/* ")
  (set (make-local-variable 'comment-end) " */")
  (set (make-local-variable 'comment-start-skip) "\\(//+\\|/\\*+\\)\\s *")
  (set (make-local-variable 'require-final-newline) t)
  (setq major-mode 'mc-mode)
  (setq mode-name "mc"))

(provide 'mc-mode)
