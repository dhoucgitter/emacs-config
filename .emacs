(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/org/95deploy.org" "~/org/dailytasks.org" "~/org/pdttestteam.org")))
 '(recentf-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq org-todo-keywords
      '((sequence "TODO(t)" "INPROGRESS(p)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(setq org-todo-keyword-faces
           '(("TODO" . org-warning) ("INPROGRESS" . "orange")
             ))
(setq org-tag-alist '(("9_5" . ?5) ("daily" . ?d) ("pdttest" . ?p) ("edu" . ?e)))
(setq org-log-done 'time)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key "\C-cy" 'bury-buffer)

(require 'cl-lib)
(eval-when-compile (require 'cl))
