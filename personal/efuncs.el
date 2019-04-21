(defun backward-kill-word-or-kill-region (&optional arg)
  (interactive "P")
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (if (equal arg nil)
        (subword-backward-kill 1)
      (subword-backward-kill arg))))

(global-set-key (kbd "C-w") 'backward-kill-word-or-kill-region)

(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

(global-set-key (kbd "M-g") 'goto-line-with-feedback)
(defun authorize-comment ()
  (interactive)
  (insert (concat "steggy: " (format-time-string "%Y-%m-%d:"))))

(global-set-key (kbd "C-x .") 'authorize-comment)

(defun http-to-git-format-config ()
  (interactive)
  (save-excursion
    (re-search-forward "url = https://github.com/\\(.*\\)" nil t)
    (replace-match "url = git@github.com:\\1" nil nil)))

(defun reload-ruby-project ()
  (interactive)
  (when (-any-p (lambda (x) (string-match "lib" x)) (projectile-current-project-dirs))
    (let ((path (concat "\""(projectile-project-root))))
      (--each (list (concat path "lib\"") (concat path "test\"")) (comint-send-string (inf-ruby-proc) (concat "$LOAD_PATH << " it "if ($LOAD_PATH & ["it "]).empty?"

                                                "\n")))))
    (projectile-process-current-project-files (lambda (x) (when (string-match ".*\.rb" x)
                                                          (ruby-load-file (concat (projectile-project-root) x)))
                                              ))
    )

(eval-after-load 'robe
  '(define-key robe-mode-map (kbd "C-c C-e") 'reload-ruby-project))

(global-set-key (kbd "C-c C-r") 'ruby-send-region)

(eval-after-load 'minitest
  '(define-key compilation-mode-map (kbd "C-x C-q") 'inf-ruby-switch-from-compilation))

(defun operate-on-file (filename func)
  (with-temp-file filename
    (insert-file-contents filename)
    (funcall func)
    (delete-trailing-whitespace)
    ))

(defvar byebug-program-name "pry-byebug")

(defun install-byebug ()
  (interactive)
  (operate-on-file (expand-file-name "Gemfile" (projectile-project-root))
                   (lambda () (unless (re-search-forward byebug-program-name nil t)
                                (progn
                                  (goto-char (point-max))
                                  (insert (concat "\ngem" byebug-program-name))
                                  ))))
  (projectile-with-default-dir (projectile-project-root)
    (shell-command "bundle"))
  (message "Byebug Installed")
  (insert "require 'byebug'; byebug"))

(defun remove-byebug ()
  (interactive)

  (operate-on-file (expand-file-name "Gemfile" (projectile-project-root))
                   (lambda () (replace-string (concat "gem" byebug-program-name ""))))
  (save-excursion
    (projectile-with-default-dir (projectile-project-root)
      (shell-command "bundle")))
  (message "Byebug Removed"))

(defun byebug-dwim ()
  (interactive)
  (with-temp-buffer
    (insert-file-contents (expand-file-name "Gemfile" (projectile-project-root)))
    (if (re-search-forward byebug-program-name nil t)
        (remove-byebug)
      (install-byebug))
    ))

(eval-after-load 'ruby-mode
  '(define-key ruby-mode-map (kbd "C-c t") 'byebug-dwim))


(defun gen-ghe-link ()
  (interactive)
  (let* ((git-base (string-trim (shell-command-to-string "git rev-parse --show-toplevel")))
         (ghe-url (string-trim (shell-command-to-string "git remote show -n origin|grep 'Fetch URL'|awk '{print $3}'|cut -f2 -d '@'|tr ':' '/'|sed 's/.git$//'")))
         (fname (string-remove-prefix git-base (buffer-file-name)))
         (line-no (line-number-at-pos))
         (url (format "https://%s/blob/master%s#L%d" ghe-url fname line-no)))
    (print url)
    (kill-new url)))

(defun github-for-source (use-current-branch)
  (interactive "P")
  (when-let
      (containing-directory (expand-file-name (locate-dominating-file (buffer-file-name) "cloud")))
    (let* ((regexp-match (s-match (concat containing-directory "\\([^/]+\\)/\\(.*\\)") (buffer-file-name)))
           (project-name (cadr regexp-match))
           (path (caddr regexp-match))
           (current-line (cadr (s-split " " (what-line))))
           (branch (if use-current-branch (magit-get-current-branch) "master"))
           )

      (kill-new (concat
        "https://github.internal.digitalocean.com/digitalocean/"
        project-name
        "/blob/" branch "/"
        path
        "#L" current-line)))))

(defun goto-current-tickler-day ()
  (interactive)
  (cl-multiple-value-bind (month day) (s-split " " (format-time-string "%B %d"))
    (find-file (concat org-directory "/gtd/" "tickler/" month "/" (first (last (s-split "^0" day))) ".org"))
    )
  )

(setq journal-template "* Things Jamie has done I appreciate
** ")

(defun goto-current-journal-day ()
  (interactive)
  (cl-multiple-value-bind (month day year) (s-split " " (format-time-string "%m %d %Y"))
    (find-file (concat org-directory "/gtd/" "journal/" year "-" month "-" (first (last (s-split "^0" day))) ".org"))
    (if (eq (buffer-size (current-buffer)) 0)
        (insert journal-template))
    )
  )

(global-set-key (kbd "C-c e") 'goto-current-tickler-day)
(global-set-key (kbd "C-c z") 'goto-current-journal-day)
