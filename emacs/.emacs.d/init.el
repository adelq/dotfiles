(add-to-list 'load-path "~/.emacs.d")
(require 'color-theme-tomorrow)
(color-theme-tomorrow--define-theme night)
(setq inhibit-startup-message t)
(setq visible-bell t)
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
          "http://marmalade-repo.org/packages/"))
(package-initialize)
