;; So I really like inserting straight shell because I know I just want to do
;; "foo bar baz" and plop it in. But obviously, going to the shell and back is
;; for suckers. The problem with simply doing C-u shell-command, though, is that
;; it inserts the newline that's at the end of each thing from the terminal. I
;; say, if I want, I can insert my own new line, hence this piece of advice
(defun shell-command-no-newline (&rest args)
  (interactive)
  (call-interactively 'shell-command)
  (save-excursion
    (move-end-of-line nil)
    (delete-char 1))
    )
(global-set-key (kbd "M-#") 'shell-command-no-newline)

(defun handle-org-mode-changes (&rest args)
  (save-excursion
    (--each
                                        ;(--remove (string= "/Users/steggy/Dropbox/national/dropbox-notes.org" it) (org-agenda-files t))
        (org-agenda-files t)
      (with-current-buffer (org-get-agenda-file-buffer it) (progn
                                                             (org-icalendar-create-uid it t nil)
                                                             (basic-save-buffer)
                                                             )))))

(advice-add 'org-icalendar-combine-agenda-files :before #'handle-org-mode-changes)
(defun fix-org-redo (&rest args)
  (org-save-all-org-buffers))

(advice-add 'org-agenda-redo :after #'fix-org-redo)
