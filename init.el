(load "~/dreamacs/dotemacs")

(defvar dreamacs-personal-dir (expand-file-name "personal" "~/.emacs.d/"))

(when (file-exists-p dreamacs-personal-dir)
  (message "Loading personal configuration files in %s..." dreamacs-personal-dir)
  (mapc 'load (directory-files dreamacs-personal-dir 't "^[^#].*el$")))

(put 'upcase-region 'disabled nil)
