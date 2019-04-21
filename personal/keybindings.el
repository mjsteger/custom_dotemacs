; I don't really use vc, and magit-status is probably way more useful than vc-create-tag, which is the original keybinding
(global-set-key (kbd "C-x v s") 'magit-status)

(global-set-key (kbd "C-c C-v") 'eshell)

(global-set-key (kbd "C-c C-g") 'smex)

(global-set-key (kbd "C-c o") 'occur)

(global-set-key (kbd "M-m") 'move-beginning-of-line)

(global-set-key (kbd "C-a") 'back-to-indentation)

(global-set-key (kbd "M-g") 'goto-line)

(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

(global-set-key (kbd "C-c C-t") 'fci-mode)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-c i") 'yas/expand)
(global-set-key (kbd "C-c f") 'fill-region)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "C-x f") 'fill-region)

(global-set-key (kbd "C-c C-m") 'smex)

; If I want to minimize emacs, I can click the button But let's be honest I
; can't remember the last time I wanted to

(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-c C-q") 'inf-ruby-switch-from-compilation)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
