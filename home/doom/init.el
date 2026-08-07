;;; init.el -*- lexical-binding: t; -*-

;; Which Doom modules are enabled. After editing — just rebuild.
;; Full module list: SPC h d m

(doom! :completion
       (corfu +orderless)          ; in-buffer completion
       (vertico +icons)            ; fuzzy search for commands, files, buffers

       :ui
       doom                        ; Doom theme and looks
       doom-dashboard              ; startup screen
       hl-todo                     ; highlight TODO/FIXME/HACK
       (ligatures +extra)          ; font ligatures
       modeline                    ; status line
       nav-flash                   ; flash on cursor jump
       ophints                     ; highlight yank/delete operations
       (popup +defaults)           ; popup window management
       treemacs                    ; file tree sidebar
       (vc-gutter +pretty)         ; git change markers in the gutter
       vi-tilde-fringe             ; tildes on empty lines, vim-style
       workspaces                  ; workspaces

       :editor
       (evil +everywhere)          ; vim bindings everywhere
       file-templates              ; new-file templates
       fold                        ; code folding
       (format +onsave)            ; format on save
       snippets                    ; snippets

       :emacs
       (dired +icons)              ; file manager
       electric                    ; smart indentation
       (ibuffer +icons)            ; buffer list
       undo                        ; advanced undo history
       vc                          ; version control integration

       :term
       vterm                       ; terminal inside Emacs

       :checkers
       syntax                      ; on-the-fly syntax checking

       :tools
       direnv                      ; picks up .envrc, like your shell
       (eval +overlay)             ; run code from the buffer
       lookup                      ; jump to definition, docs
       (lsp +peek)                 ; language servers
       magit                       ; the best git interface
       tree-sitter                 ; precise syntax highlighting

       :lang
       emacs-lisp                  ; Emacs's own language
       json
       markdown
       nix                         ; for your .nix files
       (org +pretty)               ; notes and planning
       sh                          ; shell scripts
       (zig +lsp +tree-sitter)     ; Zig with LSP and tree-sitter

       :config
       (default +bindings +smartparens))
