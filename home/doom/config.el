;;; config.el -*- lexical-binding: t; -*-

;; Personal settings. After editing — just rebuild.

;; ─── Identity ───────────────────────────────────────────────────
(setq user-full-name "is0ly"
      user-mail-address "iljaosipov@gmail.com")

;; ─── Appearance ─────────────────────────────────────────────────

;; Theme. Built-in Doom themes start with doom-*; full list: SPC h t.
;; Some to try: doom-gruvbox, doom-one, doom-tokyo-night, doom-nord,
;; doom-dracula, doom-molokai, doom-palenight, doom-monokai-pro,
;; doom-solarized-dark, doom-material, doom-city-lights.
(setq doom-theme 'doom-gruvbox)

;; Font. This is a GUI Emacs (pgtk), so the font is set here, not in foot.
(setq doom-font 
      (font-spec :family "IoskeleyMono Nerd Font"
                 :size 15
                 :width 'semi-condensed)

      doom-variable-pitch-font 
      (font-spec :family "IoskeleyMono Nerd Font"
                 :size 15
                 :width 'semi-condensed
                 ))

;; Background transparency. 0–100, where 100 is opaque.
;; alpha-background dims only the background, keeping text crisp (Emacs 29+).
(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))

;; Relative line numbers, vim-style.
(setq display-line-numbers-type 'relative)

;; ─── Org ────────────────────────────────────────────────────────
(setq org-directory "~/org/")

;; ─── Zig ────────────────────────────────────────────────────────
;; LSP (zls) comes from PATH. In your setup zls is provided per-project
;; via zig-env + direnv, which is why the direnv module in init.el is
;; required — then Emacs sees the right zls for each project.

;; ─── Wayland niceties ───────────────────────────────────────────
(pixel-scroll-precision-mode 1)   ; smooth mouse scrolling
(setq confirm-kill-emacs nil)
