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
  php-mode flx-ido projectile scala-mode)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

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

;; smartparens keybindings
;; from https://github.com/Fuco1/smartparens/wiki/Example-configuration

(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

(define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
(define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
(define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
(define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

(define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
(define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
(define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

(define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
(define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

(define-key sp-keymap (kbd "M-<delete>") 'sp-unwrap-sexp)
(define-key sp-keymap (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

(define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-<right>") 'sp-backward-barf-sexp)

(define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)
(define-key sp-keymap (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
(define-key sp-keymap (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
(define-key sp-keymap (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

(define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
(define-key sp-keymap (kbd "C-<left_bracket>") 'sp-select-previous-thing)
(define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)

(define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
(define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)

(define-key sp-keymap (kbd "C-M-s t") 'sp-prefix-tag-object)
(define-key sp-keymap (kbd "C-M-s p") 'sp-prefix-pair-object)
(define-key sp-keymap (kbd "C-M-s c") 'sp-convolute-sexp)
(define-key sp-keymap (kbd "C-M-s a") 'sp-absorb-sexp)
(define-key sp-keymap (kbd "C-M-s e") 'sp-emit-sexp)
(define-key sp-keymap (kbd "C-M-s p") 'sp-add-to-previous-sexp)
(define-key sp-keymap (kbd "C-M-s n") 'sp-add-to-next-sexp)
(define-key sp-keymap (kbd "C-M-s j") 'sp-join-sexp)
(define-key sp-keymap (kbd "C-M-s s") 'sp-split-sexp)

;;;;;;;;;;;;;;;;;;
;; pair management

(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

;;; markdown-mode
(sp-with-modes '(markdown-mode gfm-mode rst-mode)
  (sp-local-pair "*" "*" :bind "C-*")
  (sp-local-tag "2" "**" "**")
  (sp-local-tag "s" "```scheme" "```")
  (sp-local-tag "<"  "<_>" "</_>" :transform 'sp-match-sgml-tags))

;;; tex-mode latex-mode
(sp-with-modes '(tex-mode plain-tex-mode latex-mode)
  (sp-local-tag "i" "1d5f8e69396c521f645375107197ea4dfbc7b792quot;<" "1d5f8e69396c521f645375107197ea4dfbc7b792quot;>"))

;;; html-mode
(sp-with-modes '(html-mode sgml-mode)
  (sp-local-pair "<" ">"))

;;; lisp modes
(sp-with-modes sp--lisp-modes
  (sp-local-pair "(" nil :bind "C-("))

;; win switch with meta-arrows
(win-switch-setup-keys-ijkl "\C-xo" "\C-x\C-o")

;; Magit key bindings
(define-prefix-command 'my-magit-prefix)
(global-set-key (kbd "C-c g") 'my-magit-prefix)
(define-key my-magit-prefix (kbd "s") 'magit-status)
(define-key my-magit-prefix (kbd "w") 'magit-blame-mode)
(define-key my-magit-prefix (kbd "b") 'magit-branch-manager)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flx-ido-mode t)
 '(global-undo-tree-mode t)
 '(ido-everywhere t)
 '(ido-use-faces nil)
 '(ns-right-alternate-modifier (quote none))
 '(projectile-global-mode t)
 '(smartparens-global-mode t)
 '(haskell-mode-hook '(turn-on-haskell-indent)))
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
