;;; init.el -- my emacs init script
;;; Commentary:

;;; Code:
(require 'package)

;; archives
(defvar extra-archives '(("marmalade" . "https://marmalade-repo.org/packages/")
                            ("melpa" . "http://melpa.milkbox.net/packages/")))
(dolist (a extra-archives)
    (add-to-list 'package-archives a))

;; *******************************************
;; install packages
(defvar install-these '(alchemist auto-package-update ansible ansible-doc auto-complete better-defaults cider clojure-mode company company-ghc company-jedi company-tern company-web concurrent counsel ctable dash dash-functional deferred docker dockerfile-mode editorconfig elixir-mode elm-mode ensime epc epl expand-region f flycheck flycheck-clojure flycheck-haskell flymake-easy flymake-elixir flymake-php ghc git-commit haskell-mode htmlize hydra idle-highlight-mode ido-completing-read+ ido-ubiquitous jedi-core js2-mode json-mode json-reformat json-snatcher jsx-mode let-alist lua-mode magit magit-popup markdown-mode multiple-cursors names php-mode pkg-info popup projectile python-environment queue rainbow-delimiters rainbow-identifiers s sbt-mode scala-mode2 scion scpaste scss-mode shell-switcher smartparens ssh ssh-config-mode ssh-tunnels sublimity swiper tern web-completion-data web-mode with-editor yaml-mode yasnippet color-theme-sanityinc-solarized guide-key use-package string-edit exec-path-from-shell))

(package-initialize)
(package-refresh-contents)
(dolist (p install-these)
  (when (not (package-installed-p p))
    (package-install p)))

(auto-package-update-maybe)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(before-save-hook (quote (delete-trailing-whitespace)))
  '(custom-safe-themes
     (quote
       ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(editorconfig-mode t)
 '(flycheck-disabled-checkers (quote (json-jsonlist)))
 '(flycheck-flake8-maximum-complexity 10)
 '(flycheck-javascript-jshint-executable "/Users/ilau/.nvm/versions/node/v5.4.1/bin/jshint")
 '(flycheck-json-jsonlint-executable "/Users/ilau/.nvm/versions/node/v5.4.1/bin/jsonlint")
  '(flycheck-mode-hook
     (quote
       (flycheck-mode-set-explicitly flycheck-haskell-setup)))
 '(flycheck-yaml-jsyaml-executable "/Users/ilau/.nvm/versions/node/v5.4.1/bin/js-yaml")
 '(global-company-mode t)
 '(guide-key-mode t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(js2-mode-show-parse-errors t)
 '(js2-mode-show-strict-warnings nil)
 '(mac-function-modifier (quote (:ordinary hyper)))
 '(magit-emacsclient-executable "/usr/local/bin/emacsclient")
 '(magit-fetch-arguments (quote ("--prune")))
 '(magit-pull-arguments (quote ("--rebase")))
 '(magit-push-always-verify nil)
 '(magit-push-arguments nil)
 '(magit-rebase-arguments (quote ("--autostash")))
 '(markdown-command "cmark")
 '(ns-right-alternate-modifier (quote none))
 '(puml-plantuml-jar-path "/usr/local/Cellar/plantuml/8031/plantuml.8031.jar")
  '(safe-local-variable-values
     (quote
       ((haskell-process-use-ghci . t)
         (haskell-indent-spaces . 4))))
 '(split-height-threshold 85))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:weight thin :height 130 :family "Input Mono")))))

;; switch theme if gui
(when (display-graphic-p)
  (load-theme 'sanityinc-solarized-dark))

;; *******************************************
;; guide-key
(setq guide-key/guide-key-sequence t)

;; *******************************************
;; alchemist
(setq alchemist-key-command-prefix (kbd "C-c a"))

;; *******************************************
;; company-mode
(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-web-html)
(add-to-list 'company-backends 'company-web-jade)
(add-to-list 'company-backends 'company-jedi)

;; *******************************************
;; cider
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)

;; *******************************************
;; swiper & ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key (kbd "C-c C-j") 'ivy-immediate-done)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

;; *******************************************
;; set up magit
(setq magit-last-seen-setup-instructions "1.4.0")
(setq magit-repo-dirs '("~/src"))
(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-completing-read-function 'ivy-completing-read)

;; *******************************************
;; projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'ivy)
(projectile-mode)

;; *******************************************
;; smartparens
(require 'smartparens-config)
(smartparens-global-mode 1)

; sp keybinds
(define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
(define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)

(define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
(define-key smartparens-mode-map (kbd "C-M-a") 'sp-backward-down-sexp)
(define-key smartparens-mode-map (kbd "C-S-d") 'sp-beginning-of-sexp)
(define-key smartparens-mode-map (kbd "C-S-a") 'sp-end-of-sexp)

(define-key smartparens-mode-map (kbd "C-M-e") 'sp-up-sexp)
(define-key smartparens-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)

(define-key smartparens-mode-map (kbd "C-M-n") 'sp-next-sexp)
(define-key smartparens-mode-map (kbd "C-M-p") 'sp-previous-sexp)

(define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)

(define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
(define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

(define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-backward-barf-sexp)

(define-key smartparens-mode-map (kbd "M-D") 'sp-splice-sexp)
(define-key smartparens-mode-map (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
(define-key smartparens-mode-map (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
(define-key smartparens-mode-map (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

(define-key smartparens-mode-map (kbd "C-]") 'sp-select-next-thing-exchange)
(define-key smartparens-mode-map (kbd "C-<left_bracket>") 'sp-select-previous-thing)
(define-key smartparens-mode-map (kbd "C-M-]") 'sp-select-next-thing)

(define-key smartparens-mode-map (kbd "M-F") 'sp-forward-symbol)
(define-key smartparens-mode-map (kbd "M-B") 'sp-backward-symbol)

(bind-key "C-M-s"
          (defhydra smartparens-hydra ()
            "Smartparens"
            ("d" sp-down-sexp "Down")
            ("e" sp-up-sexp "Up")
            ("u" sp-backward-up-sexp "Up")
            ("a" sp-backward-down-sexp "Down")
            ("f" sp-forward-sexp "Forward")
            ("b" sp-backward-sexp "Backward")
            ("k" sp-kill-sexp "Kill" :color blue)
            ("q" nil "Quit" :color blue))
          smartparens-mode-map)

(bind-key "H-t" 'sp-prefix-tag-object smartparens-mode-map)
(bind-key "H-p" 'sp-prefix-pair-object smartparens-mode-map)
(bind-key "H-y" 'sp-prefix-symbol-object smartparens-mode-map)
(bind-key "H-h" 'sp-highlight-current-sexp smartparens-mode-map)
(bind-key "H-e" 'sp-prefix-save-excursion smartparens-mode-map)
(bind-key "H-s c" 'sp-convolute-sexp smartparens-mode-map)
(bind-key "H-s a" 'sp-absorb-sexp smartparens-mode-map)
(bind-key "H-s e" 'sp-emit-sexp smartparens-mode-map)
(bind-key "H-s p" 'sp-add-to-previous-sexp smartparens-mode-map)
(bind-key "H-s n" 'sp-add-to-next-sexp smartparens-mode-map)
(bind-key "H-s j" 'sp-join-sexp smartparens-mode-map)
(bind-key "H-s s" 'sp-split-sexp smartparens-mode-map)
(bind-key "H-s r" 'sp-rewrap-sexp smartparens-mode-map)
(defvar hyp-s-x-map)
(define-prefix-command 'hyp-s-x-map)
(bind-key "H-s x" hyp-s-x-map smartparens-mode-map)
(bind-key "H-s x x" 'sp-extract-before-sexp smartparens-mode-map)
(bind-key "H-s x a" 'sp-extract-after-sexp smartparens-mode-map)
(bind-key "H-s x s" 'sp-swap-enclosing-sexp smartparens-mode-map)

(bind-key "C-x C-t" 'sp-transpose-hybrid-sexp smartparens-mode-map)

(bind-key ";" 'sp-comment emacs-lisp-mode-map)

(bind-key [remap c-electric-backspace] 'sp-backward-delete-char smartparens-strict-mode-map)

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
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; from https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking/
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."
  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (equal web-mode-content-type "jsx")
              ;; enable flycheck
              (flycheck-select-checker 'jsxhint-checker)
              (flycheck-mode))))

;; *******************************************
;; forcibly turn off ido mode
(ido-mode 0)

;; *******************************************
;; haskell stuff
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-'") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

(define-key haskell-cabal-mode-map (kbd "C-'") 'haskell-interactive-bring)
(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)

;; *******************************************
;; electricity
(electric-indent-mode)
(electric-pair-mode)

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

;; *******************************************
;; rainbows!
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)

;; *******************************************
;; shell switcher
(setq shell-switcher-mode t)
(define-key shell-switcher-mode-map (kbd "C-'")
  'shell-switcher-switch-buffer)
(require 'shell-switcher)

;; *******************************************
;; windmove
(global-set-key (kbd "<A-M-left>") 'windmove-left)
(global-set-key (kbd "<A-M-up>") 'windmove-up)
(global-set-key (kbd "<A-M-right>") 'windmove-right)
(global-set-key (kbd "<A-M-down>") 'windmove-down)


;; *******************************************
;; chain checkers for python
(flycheck-add-next-checker 'python-flake8 'python-pylint)

;; *******************************************
;; get exec path from shell on mac only
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; DRUBAL XDDDD
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.theme$" . php-mode))

;; *******************************************
;; always start server
(server-start)
