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

    output "DP-1" {
        mode "1920x1080@60.000"
        scale 1
        position x=0 y=0
    }

    output "HDMI-A-1" {
        mode "3840x2160@143.988"
        scale 1.25
        position x=1920 y=0
        variable-refresh-rate on-demand=true
        focus-at-startup
    }

    layout {
        gaps 10
        center-focused-column "never"

        default-column-width {
            proportion 0.5
        }

        focus-ring {
            width 1
            active-color "#6E4F5F"
            inactive-color "#3E3940"
        }

        border {
            off
        }
    }

    prefer-no-csd

    spawn-at-startup "noctalia"

    spawn-at-startup "sh" "-c" "sleep 3 && openrgb --profile /home/ilia/.config/OpenRGB/1.orp && openrgb --device 2 --mode direct --color FFFFFF"

    window-rule {
        geometry-corner-radius 3
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

        Mod+Shift+Left { move-workspace-to-monitor-left; }
        Mod+Shift+Right { move-workspace-to-monitor-right; }

        Mod+R { switch-preset-column-width; }
        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }

        Mod+W { expand-column-to-available-width; }

        Mod+Shift+S { screenshot; }
        Mod+Shift+F { screenshot-screen; }
        Mod+Shift+W { screenshot-window; }

        // MouseForward repeat=false { spawn "foot"; }
        // MouseBack repeat=false { close-window; }
    }
  '';
}
