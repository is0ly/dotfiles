{ ... }:

{
  xdg.configFile."niri/config.kdl".text = ''
    prefer-no-csd

    layout {
        gaps 8

        center-focused-column "never"

        default-column-width {
            proportion 0.5
        }

        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }

        focus-ring {
            off
        }

        border {
            off
        }
    }

    spawn-at-startup "waybar"

    hotkey-overlay {
        skip-at-startup
    }

    animations {
    }

    binds {
        Mod+Return {
            spawn "foot"
        }

        Mod+T {
            spawn "ghostty"
        }

        Mod+Q {
            close-window
        }

        Mod+Shift+Q {
            close-window
        }

        Mod+O repeat=false {
            toggle-overview
        }

        Mod+Left {
            focus-column-left
        }

        Mod+Right {
            focus-column-right
        }

        Mod+Up {
            focus-window-up
        }

        Mod+Down {
            focus-window-down
        }

        Mod+H {
            focus-column-left
        }

        Mod+L {
            focus-column-right
        }

        Mod+K {
            focus-window-up
        }

        Mod+J {
            focus-window-down
        }

        Mod+Ctrl+Left {
            move-column-left
        }

        Mod+Ctrl+Right {
            move-column-right
        }

        Mod+Ctrl+Up {
            move-window-up
        }

        Mod+Ctrl+Down {
            move-window-down
        }

        Mod+Ctrl+H {
            move-column-left
        }

        Mod+Ctrl+L {
            move-column-right
        }

        Mod+Ctrl+K {
            move-window-up
        }

        Mod+Ctrl+J {
            move-window-down
        }

        Mod+Page_Down {
            focus-workspace-down
        }

        Mod+Page_Up {
            focus-workspace-up
        }

        Mod+Ctrl+Page_Down {
            move-column-to-workspace-down
        }

        Mod+Ctrl+Page_Up {
            move-column-to-workspace-up
        }

        Mod+WheelScrollDown cooldown-ms=150 {
            focus-workspace-down
        }

        Mod+WheelScrollUp cooldown-ms=150 {
            focus-workspace-up
        }

        Mod+1 {
            focus-workspace 1
        }

        Mod+2 {
            focus-workspace 2
        }

        Mod+3 {
            focus-workspace 3
        }

        Mod+4 {
            focus-workspace 4
        }

        Mod+5 {
            focus-workspace 5
        }

        Mod+Ctrl+1 {
            move-column-to-workspace 1
        }

        Mod+Ctrl+2 {
            move-column-to-workspace 2
        }

        Mod+Ctrl+3 {
            move-column-to-workspace 3
        }

        Mod+Ctrl+4 {
            move-column-to-workspace 4
        }

        Mod+Ctrl+5 {
            move-column-to-workspace 5
        }

        Mod+R {
            switch-preset-column-width
        }

        Mod+Shift+R {
            switch-preset-column-width-back
        }

        Mod+Minus {
            set-column-width "-10%"
        }

        Mod+Equal {
            set-column-width "+10%"
        }

        Mod+F {
            maximize-column
        }

        Mod+Shift+F {
            fullscreen-window
        }

        Mod+C {
            center-column
        }

        Mod+V {
            toggle-window-floating
        }

        Print {
            screenshot
        }

        Mod+Shift+E {
            quit
        }
    }
  '';
}
