;;;; init.el --- Let's get cracking
;;
;; Copyright (c) 2014 Ilkka Laukkanen

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file simply sets up the default load path and requires
;; Emacs Prelude.

;;; License:

;; WTFPL (http://www.wtfpl.net)

(defvar ext-prelude-dir (expand-file-name "~/.prelude"))
(when (file-exists-p ext-prelude-dir)
  (message "Loading Prelude from %s..." ext-prelude-dir)
  (load (expand-file-name "init.el" ext-prelude-dir)))

(defvar ext-modules-file (expand-file-name "~/.emacs.d/prelude-modules.el"))
(when (file-exists-p ext-modules-file)
  (message "Loading Prelude modules from %s..." ext-modules-file)
  (load ext-modules-file))

(defvar ext-personal-dir (expand-file-name "~/.emacs.d/prelude-personal"))
(when (file-exists-p ext-personal-dir)
  (message "Loading personal configuration files in %s..." ext-personal-dir)
  (mapc 'load (directory-files ext-personal-dir 't "^[^#].*el$")))

;;;; init.el ends here
