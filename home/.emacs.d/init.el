(require 'package)

;; path fix for homebrew
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-emacsclient-executable "/usr/local/bin/emacsclient")
 '(ns-right-alternate-modifier (quote none))
    '(package-archives
         (quote
             (("marmalade" . "https://marmalade-repo.org/packages/")
                 ("melpa" . "http://melpa.milkbox.net/packages/")
                 ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(smex-completion-method (quote ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; *******************************************
;; other generic setup
(global-set-key (kbd "C-x p") 'find-file-in-project)

;; *******************************************
;; install packages
(defvar install-these '(better-defaults
			paredit
			idle-highlight-mode
			ido-ubiquitous
			find-file-in-project
			magit
                        swiper
                        multiple-cursors
                        expand-region
                        editorconfig
                        projectile
                        ensime))

(package-initialize)
(dolist (p install-these)
  (when (not (package-installed-p p))
    (package-install p)))

;; *******************************************
;; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; *******************************************
;; set up magit
(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-repo-dirs '("~/src"))
(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-completing-read-function 'ivy-completing-read)

;; *******************************************
;; projectile
(projectile-global-mode)
(setq projectile-completion-system 'ivy)

;; *******************************************
;; set up smex
(add-to-list 'load-path "~/.emacs.d/smex")
(require 'smex)
(smex-initialize)
;; we have ivy but we also have the fork of smex that supports that
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; to use normal M-x:
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; *******************************************
;; set up ido-ubiquitous
; -> nuh uh, use ivy-mode
;; enable ido
;(ido-mode 1)
;(ido-everywhere 1)
;; ido for org-mode and magit
;(setq org-completion-use-ido t)
;(setq magit-completing-read-functon 'magit-ido-completing-read)
;; ido-ubiquitous itself
;(ido-ubiquitous-mode 1)

;; *******************************************
;; basic paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

;; *******************************************
;; swiper
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-r") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; *******************************************
;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-more-like-this-extended)

;; *******************************************
;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; *******************************************
;; editorconfig
(load "editorconfig")

;; *******************************************
;; ensime for scala
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
