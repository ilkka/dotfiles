;;; init.el -- my emacs init script
;;; Commentary:

;;; Code:
(require 'package)

;; extra path settings
(setenv "PATH" (concat "/Users/ilau/.cabal/bin:/Users/ilau/.nvm/versions/node/v0.12.4/bin:/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append '("/Users/ilau/.cabal/bin:/Users/ilau/.nvm/versions/node/v0.12.4/bin" "/usr/local/bin") exec-path))

;; archives
(defvar extra-archives '(("marmalade" . "https://marmalade-repo.org/packages/")
                            ("melpa" . "http://melpa.milkbox.net/packages/")))
(dolist (a extra-archives)
    (add-to-list 'package-archives a))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-yaml-jsyaml-executable "/Users/ilau/.nvm/versions/node/v0.12.4/bin/js-yaml")
 '(magit-emacsclient-executable "/usr/local/bin/emacsclient")
 '(markdown-command "cmark")
 '(ns-right-alternate-modifier (quote none))
 '(smex-completion-method (quote ivy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Input Mono")))))

;; *******************************************
;; other generic setup
(global-set-key (kbd "C-x p") 'find-file-in-project)

;; *******************************************
;; install packages
(defvar install-these '(better-defaults
                           paredit
                           idle-highlight-mode
                           find-file-in-project
                           magit
                           swiper
                           multiple-cursors
                           expand-region
                           editorconfig
                           projectile
                           ensime
                           cider
                           markdown-mode
                           company
                           company-tern
                           company-web
                           company-jedi
                           jedi-core
                           tern))

(package-initialize)
(dolist (p install-these)
  (when (not (package-installed-p p))
    (package-install p)))

;; *******************************************
;; company-mode
(global-company-mode)
(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-web-html)
(add-to-list 'company-backends 'company-web-jade)
(add-to-list 'company-backends 'company-jedi)

;; *******************************************
;; cider
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; *******************************************
;; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key (kbd "C-c C-j") 'ivy-immediate-done)

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
(add-to-list 'load-path (expand-file-name "~/.emacs.d/smex"))
(require 'smex)
(smex-initialize)
;; we have ivy but we also have the fork of smex that supports that
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; to use normal M-x:
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

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

;; *******************************************
;; jsx stuff (from http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html)
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; *******************************************
;; forcibly turn off ido mode
(ido-mode 0)

;; *******************************************
;; winner mode
(winner-mode 1)

;; *******************************************
;; utilities

(defun run-command-on-current-buffer-file (command)
    "Run command on the file of the current buffer and revert the buffer"
    (interactive)
    (shell-command
        (format "%s %s"
            (shell-quote-argument command)
            (shell-quote-argument (buffer-file-name))))
    (revert-buffer t t t))

(defun doctoc-current-buffer-file ()
    "Run doctoc on the current file"
    (interactive)
    (run-command-on-current-buffer-file "doctoc"))
