{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "foot";
      "$menu" = "wofi --show drun";

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
        "$mod, Return, exec, uwsm app -- $terminal"
        "$mod, D, exec, uwsm app -- $menu"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, F, fullscreen"
        "$mod, Space, togglefloating"

        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
