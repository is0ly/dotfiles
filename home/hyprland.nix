{ ... }:

let
  modifier = "SUPER";
  terminal = "ghostty";
  menu = "fuzzel";
in
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # Let Hyprland choose the preferred mode for every connected display.
      # Machine-specific monitor layout can be added here later.
      monitor = [ ",preferred,auto,1" ];

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;

        touchpad.natural_scroll = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
      };

      decoration = {
        rounding = 8;

        blur = {
          enabled = true;
          size = 6;
          passes = 2;
        };
      };

      animations.enabled = true;

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      exec-once = [
        "uwsm app -- waybar"
      ];

      bind = [
        "${modifier}, Return, exec, uwsm app -- ${terminal}"
        "${modifier}, D, exec, uwsm app -- ${menu}"
        "${modifier}, Q, killactive"
        "${modifier}, M, exit"
        "${modifier}, F, fullscreen"
        "${modifier}, Space, togglefloating"

        "${modifier}, H, movefocus, l"
        "${modifier}, L, movefocus, r"
        "${modifier}, K, movefocus, u"
        "${modifier}, J, movefocus, d"

        "${modifier}, 1, workspace, 1"
        "${modifier}, 2, workspace, 2"
        "${modifier}, 3, workspace, 3"
        "${modifier}, 4, workspace, 4"
        "${modifier}, 5, workspace, 5"
        "${modifier} SHIFT, 1, movetoworkspace, 1"
        "${modifier} SHIFT, 2, movetoworkspace, 2"
        "${modifier} SHIFT, 3, movetoworkspace, 3"
        "${modifier} SHIFT, 4, movetoworkspace, 4"
        "${modifier} SHIFT, 5, movetoworkspace, 5"
      ];

      bindm = [
        "${modifier}, mouse:272, movewindow"
        "${modifier}, mouse:273, resizewindow"
      ];
    };
  };
}
