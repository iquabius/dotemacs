;;; Begin initialization
;; Turn off mouse interface early in startup to avoid momentary display
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;; Set up package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

; To avoid setting :straight t everytime
(setq straight-use-package-by-default t)

;; Is there a way to do this with straight.el?
(straight-use-package 'diminish)
; org-gcal error: (void-function org-dynamic-block-define)
;(straight-use-package 'org-plus-contrib)

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
  ;; We could avoid refreshing twice on the first run:
  ;; https://github.com/raxod502/straight.el/blob/5d046ad09413f3aba6198229e392cdd3f07e77ee/benchmark/straight-bench.el#L225-L231
(straight-use-package 'use-package)
;(use-package use-package-ensure-system-package
;  :straight t)

;(eval-when-compile
;  (require 'use-package))
;(require 'diminish) ;; if you use :diminish
;(require 'bind-key) ;; if you use any :bind variant
;(setq use-package-verbose t)

;;; Load the config
(org-babel-load-file (concat user-emacs-directory "config.org"))
