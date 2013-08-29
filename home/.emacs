;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(add-to-list 'load-path "~/.emacs.d/better-defaults")
(load "better-defaults")
(add-to-list 'load-path "~/.emacs.d/ido-hacks")
(load "ido-hacks")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar prelude-packages '(ack-and-a-half auctex clojure-mode
  clojure-test-mode nrepl coffee-mode deft expand-region gist
  groovy-mode haml-mode haskell-mode inf-ruby magit magithub
  markdown-mode smartparens projectile python sass-mode rainbow-delimiters
  scss-mode solarized-theme volatile-highlights yaml-mode yari
  zenburn-theme smex auto-complete ac-nrepl undo-tree win-switch
  php-mode)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finalsly (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; set default theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/molokai-theme/")
(setq molokai-theme-kit t)
(load-theme 'molokai t)

;; replace regular M-x with smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; turn on autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; turn on ac-nrepl
(require 'ac-nrepl)
 (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
 (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
 (eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'nrepl-mode))

;; ac-nrepl on TAB
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

;; always rainbow
(global-rainbow-delimiters-mode)

;; default smartparens config
(require 'smartparens-config)

;; win switch with meta-arrows
(win-switch-setup-keys-ijkl "\C-xo" "\C-x\C-o")

;; always undo tree mode
(undo-tree-mode t)
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ns-right-alternate-modifier (quote none))
 '(smartparens-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "Red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "Magenta"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "Orange"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "Green"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "Cyan"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "Blue"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "Yellow"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "Purple"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "Brown")))))
