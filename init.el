(defvar dreamacs-personal-dir (expand-file-name "personal" "~/.emacs.d/"))

(setq dreamacs-personal-modules '(
                                  org
                                  ))

(setq dreamacs-personal-configurationless-modules '())


(load "~/play/dreamacs/dotemacs")

(when (file-exists-p dreamacs-personal-dir)
  (message "Loading personal configuration files in %s..." dreamacs-personal-dir)
  (mapc 'load (directory-files dreamacs-personal-dir 't "^[^#].*el$")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-rainbow-delimiters-mode t)
 '(org-agenda-files (quote ("/Users/michaelsteger/Dropbox/national/tickler.org" "/Users/michaelsteger/Dropbox/national/todo.org" "/Users/michaelsteger/Dropbox/national/notes.org" "/Users/michaelsteger/Dropbox/national/work.org" "~/dreamacs/modules/dreamacs-org.el")) t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red2"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "brown"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "purple2")))))

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
                        rainbow-delimiters
                        ))

(put 'upcase-region 'disabled nil)
(dreamacs-require-packages '(ample-theme unicode-fonts))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "#323232"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red1"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "green4"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#268bd2"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "dark orchid"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow3")))))

(when (member "Inconsolata-g" (font-family-list))
  (set-face-attribute 'default nil :font "Inconsolata-g"))

(unicode-fonts-setup)
