(setenv "GOPATH" "/Users/steggy/work/cthulhu/docode")

(add-to-list 'exec-path "/Users/steggy/work/cthulhu/docode/bin")

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") 'godef-jump)))

(setq gofmt-command "goimports")


;; Will need to go get the following:

;; go get github.com/rogpeppe/godef
;; go get -u github.com/nsf/gocode
