{ ... }:

{
  xdg.configFile."niri/config.kdl".text = ''
    input {
        keyboard {
            xkb {
                layout "us,ru"
                options "grp:alt_shift_toggle"
            }
        }

        touchpad {
            tap
            natural-scroll
        }

        focus-follows-mouse max-scroll-amount="0%"
    }

    layout {
        gaps 10
        center-focused-column "never"

        default-column-width {
            proportion 0.5
        }

        focus-ring {
            width 2
            active-color "#d79921"
            inactive-color "#504945"
        }

        border {
            off
        }
    }

    prefer-no-csd

    spawn-at-startup "noctalia"

    window-rule {
        geometry-corner-radius 8
        clip-to-geometry true
    }

    hotkey-overlay {
        skip-at-startup
    }

    binds {
        Mod+Return { spawn "foot"; }
        Mod+D { spawn "noctalia" "msg" "panel-toggle" "launcher"; }

        Mod+Q repeat=false { close-window; }
        Mod+M { quit; }
        Mod+F { fullscreen-window; }
        Mod+Space { toggle-window-floating; }

        Mod+H { focus-column-left; }
        Mod+J { focus-window-down; }
        Mod+K { focus-window-up; }
        Mod+L { focus-column-right; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }

        Mod+Shift+1 { move-window-to-workspace 1; }
        Mod+Shift+2 { move-window-to-workspace 2; }
        Mod+Shift+3 { move-window-to-workspace 3; }
        Mod+Shift+4 { move-window-to-workspace 4; }
        Mod+Shift+5 { move-window-to-workspace 5; }
    }
  '';
}
