;; All customized Emacs configuration will be placed in the following file
(setq custom-file "~/.emacs-custom.el")
(load custom-file)

;; Taken from Sacha Chua's Emacs config suggestions http://pages.sachachua.com/.emacs.d/Sacha.html#unnumbered-2
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(display-time-mode 1)
(setq display-time-format "%l:%M%p")

(require 'whitespace)
(setq whitespace-style '(trailing lines tab-mark))
(setq whitespace-line-column 80)
(global-whitespace-mode 1)
(eval-after-load "diminish"
  '(progn
     (eval-after-load "whitespace"
       '(diminish 'global-whitespace-mode "ᗣ"))
     (eval-after-load "whitespace"
       '(diminish 'whitespace-mode ""))))

(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;; org-mode
(setq org-capture-templates 
(quote (
("n" "Notes" entry (file+datetree 
"~/org/taskdiary.org") 
"* %^{Description} %^g %? 
Added: %U") 
("t" "Task Diary" entry (file+datetree 
"~/org/taskdiary.org") 
"* TODO %^{Description}  %^g
%?
Added: %U") 
("j" "Journal" entry (file+datetree 
"~/org/workjournal.org") 
"** %^{Heading}")  
("l" "Log Time" entry (file+datetree 
"~/org/timelog.org" ) 
"** %U - %^{Activity}  :TIME:")
)))
	

(setq org-todo-keywords
      '((sequence "TODO(t!)" "INPROGRESS(p@/!)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(setq org-todo-keyword-faces
           '(("TODO" . org-warning) ("INPROGRESS" . "orange")
             ))
(setq org-tag-alist '(("9_5" . ?5) ("daily" . ?d) ("pdttest" . ?p) ("edu" . ?e)))
(setq org-log-done 'time)
(setq org-directory "/home/david/org/")

(global-set-key "\C-cl" 'org-store-link)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-xo" 'ace-window)

(global-set-key (kbd "C-x p i") 'org-cliplink)

(global-set-key "\C-cy" 'bury-buffer)


;; Remove all the appointment entries before calling org-agenda-to-appt
(defadvice org-agenda-to-appt (before wickedcool activate)
  "Clear the appt-time-msg-list."
  (setq appt-time-msg-list nil))


(require 'cl-lib)
(eval-when-compile (require 'cl))
(require 'ace-window)
(require 'windmove)


(defun david/def-rep-command (alist)
    "Return a lambda that calls the first function of ALIST.
It sets the transient map to all functions of ALIST,
allowing you to repeat those functions as needed."
    (lexical-let ((keymap (make-sparse-keymap))
                  (func (cdar alist)))
      (mapc (lambda (x)
              (when x
                (define-key keymap (kbd (car x)) (cdr x))))
            alist)
      (lambda (arg)
        (interactive "p")
        (when func
          (funcall func arg))
        (set-transient-map keymap t))))

(key-chord-define-global "yy"   
      (david/def-rep-command
       '(nil
         ("<left>" . windmove-left)
         ("<right>" . windmove-right)
         ("<down>" . windmove-down)
         ("<up>" . windmove-up)
         ("y" . other-window)
         ("h" . ace-window)
         ("s" . (lambda () (interactive) (ace-window 4)))
         ("d" . (lambda () (interactive) (ace-window 16)))
         )))

(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(require 'diminish)

(require 'pabbrev)
(load-theme 'alect-dark t)
(global-set-key (kbd "C-'") #'cbm-cycle)

(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

(key-chord-mode 1)
