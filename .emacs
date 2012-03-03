;package manager
(add-to-list 'load-path "~/.emacs.d/")

;
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(tool-bar-mode -1)
;disable bell in nw mode
(setq visible-bell t)
(setq ring-bell-function (lambda ()))

;iswitch: C-x b switch
;(iswitchb-mode 1)
;(setq iswitchb-buffer-ignore '("^\\*")) ;ignore buffs starting w *
;(add-to-list 'iswitchb-buffer-ignore "^\\*")

;add org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-startup-indented t)

;add theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (load-file "~/.emacs.d/color-theme-railscasts.el")
     (color-theme-railscasts)))

;ido-mode: 
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(show-paren-mode 1)

;syntax highlighing in slime repl:
;(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)

;setup python stuff
(require 'pymacs)
(pymacs-load "ropemacs" "rope-") 
;;; bind RET to py-newline-and-indent
(add-hook 'python-mode-hook '(lambda () 
     (define-key python-mode-map "\C-m" 'newline-and-indent)))

;;; python tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(require 'misc)
(global-set-key "\M-f" 'forward-to-word)
(global-set-key "\M-b" 'backward-to-word)
