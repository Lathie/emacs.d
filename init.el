(delete-selection-mode)
(blink-cursor-mode 0)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; Set up Helm
(require 'helm)
(helm-autoresize-mode 1)
(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x C-f") 'helm-projectile)
(global-unset-key (kbd "C-x c"))
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x f") 'helm-find-files)

;; Language Spacing and such
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode t)
(setq-default require-final-newline t)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default ruby-indent-level 2)
(setq-default js-indent-level 2)
(setq-default indent-tabs-mode nil)
(setq web-mode-code-indent-offset 2)

(setq initial-scratch-message "")
(setq inhibit-startup-message t)
;; (scroll-bar-mode 0) ;; doesn't work on macos
(tool-bar-mode 0)
(menu-bar-mode 0)
(setq ring-bell-function 'ignore)

(setq tramp-default-method "ssh")

(setq custom-safe-themes t)
(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow-eighties)

(set-frame-font "mononoki-20")
(setq default-frame-alist '((font . "mononoki-20")))
(add-to-list 'default-frame-alist
                          '(vertical-scroll-bars . nil))

(setq system-uses-terminfo nil)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/test.org"
														 "~/org/life.org"))

(global-set-key (kbd "C-c g") 'avy-goto-char)

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

(set-frame-parameter (selected-frame) 'alpha '(95 . 85))
(add-to-list 'default-frame-alist '(alpha . (95 . 85)))

(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file "~/.emacs.d/tmp/savehist")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(sanityinc-tomorrow-eighties))
 '(package-selected-packages
   '(auto-package-update avy color-theme-sanityinc-tomorrow go-mode
                         helm-projectile magit pkg-info popup
                         rust-mode solarized-theme web-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))
