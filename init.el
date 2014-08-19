(defvar dreamacs-personal-dir (expand-file-name "personal" "~/.emacs.d/"))

(load "~/dreamacs/dotemacs")

(when (file-exists-p dreamacs-personal-dir)
  (message "Loading personal configuration files in %s..." dreamacs-personal-dir)
  (mapc 'load (directory-files dreamacs-personal-dir 't "^[^#].*el$")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("/Users/michaelsteger/Dropbox/national/tickler.org" "/Users/michaelsteger/Dropbox/national/todo.org" "/Users/michaelsteger/Dropbox/national/notes.org" "/Users/michaelsteger/Dropbox/national/work.org" "~/dreamacs/modules/dreamacs-org.el")))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "brown"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "alternateSelectedControlColor"))))
 )
 )

(setq initial-scratch-message ";; Do you wrestle with dreams?
;; Do you contend with shadows?
;; Do you move in a kind of sleep?

;; Time has slipped away
;; Your life is stolen
;; You tarried with trifles
;; Victim of your folly

;; He’s the best of us.
;; The best of our best, the best that each of us will ever build or ever love.
;; So pray for this Guardian of our growth and choose him well, for if he be not truly blessed, then our designs are surely frivolous and our future but a tragic waste of hope.
;; Bless our best and adore for he doth bear our measure to the Cosmos.
")

(global-company-mode -1)
(global-linum-mode -1)

(require-all-dreamacs '(
                        org
                        rainbow-delimiters
                        ))

(put 'upcase-region 'disabled nil)
