(defvar dreamacs-personal-dir (expand-file-name "personal" "~/.emacs.d/"))

(setq dreamacs-personal-modules '(
                                  org
                                  clojure
                                  rainbow-delimiters
                                  editor-tweaks
                                  ))

(setq dreamacs-personal-configurationless-modules '())

(add-to-list 'load-path dreamacs-personal-dir)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ruby-refactor-keymap-prefix (kbd "C-c n"))
 '(custom-safe-themes
   (quote
    ("f0d8af755039aa25cd0792ace9002ba885fd14ac8e8807388ab00ec84c9497d7" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "8453c6ba2504874309bdfcda0a69236814cefb860a528eb978b5489422cb1791" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "30b7087fdd149a523aa614568dc6bacfab884145f4a67d64c80d6011d4c90837" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "4f81886421185048bd186fbccc98d95fca9c8b6a401771b7457d81f749f5df75" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "8fed5e4b89cf69107d524c4b91b4a4c35bcf1b3563d5f306608f0c48f580fdf8" "3f78849e36a0a457ad71c1bda01001e3e197fe1837cb6eaa829eb37f0a4bdad5" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "76626efc044daee1c402e50f185bd633d1a688c332bc15c8fd5db4cdf2966b79" "11636897679ca534f0dec6f5e3cb12f28bf217a527755f6b9e744bd240ed47e1" default)))
 '(flycheck-display-errors-delay 0.0)
 '(global-flycheck-mode t)
 '(global-rainbow-delimiters-mode t)
 '(global-whitespace-mode t)
 '(ido-ubiquitous-mode t)
 '(org-agenda-files
   (quote
    ("/Users/steggy/Dropbox/national/dropbox-notes.org" "/Users/steggy/Dropbox/national/google.org" "/Users/steggy/Dropbox/national/home.org" "/Users/steggy/Dropbox/national/work.org" "/Users/steggy/Dropbox/national/interesting.org" "/Users/steggy/Dropbox/national/notes.org" "/Users/steggy/Dropbox/national/todo.org" "/Users/steggy/Dropbox/national/tickler.org")))
 '(projectile-completion-system (quote grizzl))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "brown"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "alternateSelectedControlColor"))))
 '(show-paren-mode t))

(load "~/play/dreamacs/dotemacs")
(load-theme 'tango-dark)

(when (file-exists-p dreamacs-personal-dir)
  (message "Loading personal configuration files in %s..." dreamacs-personal-dir)
  (mapc 'load (directory-files dreamacs-personal-dir 't "^[^#].*el$")))



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

;; Meditation brings wisdom, lack of wisdom leaves ignorance.
;; Know well what leads you forward and what holds you back.
")

(global-company-mode -1)
(global-linum-mode -1)

(put 'upcase-region 'disabled nil)
; (dreamacs-require-packages '(ample-theme unicode-fonts))


(when (member "Inconsolata-g" (font-family-list))
  (set-face-attribute 'default nil :font "Inconsolata-g"))
;; (require 'unicode-fonts)
;; (unicode-fonts-setup)
(when (member "Apple Color Emoji" (font-family-list))
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))
(when (member "Quivira" (font-family-list))
  (set-fontset-font t 'unicode "Quivira" nil 'prepend))

(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "teal"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "brown")))))


(with-eval-after-load 'helm
  ;; make sure you have flx installed
  (require 'flx)
  ;; this is a bit hackish, ATM, redefining functions I don't own
  (defvar helm-flx-cache (flx-make-string-cache #'flx-get-heatmap-str))

  (defun helm-score-candidate-for-pattern (candidate pattern)
    (car (flx-score candidate pattern helm-flx-cache)))

  (defun helm-fuzzy-default-highlight-match (candidate)
    (let* ((pair (and (consp candidate) candidate))
            (display (if pair (car pair) candidate))
            (real (cdr pair)))
      (with-temp-buffer
        (insert display)
        (goto-char (point-min))
        (if (string-match-p " " helm-pattern)
          (cl-loop with pattern = (split-string helm-pattern)
            for p in pattern
            do (when (search-forward p nil t)
                 (add-text-properties
                   (match-beginning 0) (match-end 0) '(face helm-match))))
          (cl-loop with pattern = (cdr (flx-score display
                                         helm-pattern helm-flx-cache))
            for index in pattern
            do (add-text-properties
                 (1+ index) (+ 2 index) '(face helm-match))))
        (setq display (buffer-string)))
      (if real (cons display real) display))))
(defun helm-score-candidate-for-pattern (candidate pattern)
  (or (car (flx-score candidate pattern helm-flx-cache)) 0))
