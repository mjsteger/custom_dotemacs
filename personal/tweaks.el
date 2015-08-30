
;; So I really like inserting straight shell because I know I just want to do
;; "foo bar baz" and plop it in. But obviously, going to the shell and back is
;; for suckers. The problem with simply doing C-u shell-command, though, is that
;; it inserts the newline that's at the end of each thing from the terminal. I
;; say, if I want, I can insert my own new line, hence this piece of advice
(defun fix-shell-command-newline (&rest args)
  (save-excursion
    (move-end-of-line nil)
    (delete-char 1))
  )
(advice-add 'shell-command :after #'fix-shell-command-newline)
