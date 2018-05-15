;; Add all paths recursively in to load-path in .emacs.d
(let ((default-directory  "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Setup MELPA archive for auto download and initialize package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Configure use package macro
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/use-package")
  (require 'use-package))


;; Custom packages
;;  elpy
(use-package elpy
  ;; Following line is required for auto download of missing packages
  :ensure t
  :config
  (elpy-enable)
  (add-hook 'python-mode-hook 'auto-complete-mode t))

;; better-defaults
(use-package better-defaults)

;; smooth-scrolling
(use-package smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 1)

;; jedi.el
(use-package company-jedi
  :ensure t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

;(when (not package-archive-contents)
;  (package-refresh-contents))

;; Customization
(setq inhibit-startup-message t) ;; hide the startup message
(global-linum-mode t) ;; enable line numbers globally
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; remove trailing whitespace on save

;; Auto-generated configs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (virtualenvwrapper jedi:install-server virtualenv company-jedi jedi elpy smooth-scrolling better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
