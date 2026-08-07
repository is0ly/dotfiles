;; -*- no-byte-compile: t; -*-
;;; packages.el

;; Extra packages beyond the module defaults.
;; After editing — just rebuild (not doom sync; Nix builds everything).

;; Classic gruvbox theme (Doom ships doom-gruvbox built-in; this package
;; provides the "original" gruvbox — use 'gruvbox instead of 'doom-gruvbox).
(package! gruvbox-theme)

;; Add a MELPA package:
;; (package! nyan-mode)

;; Add a package straight from git:
;; (package! some-package
;;   :recipe (:host github :repo "author/some-package"))
