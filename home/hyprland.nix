{ lib, ... }:

let
  modifier = "SUPER";
  terminal = "ghostty";
  menu = "fuzzel";

  lua = lib.generators.mkLuaInline;

  bind = keys: dispatcher: {
    _args = [
      keys
      (lua dispatcher)
    ];
  };

  mouseBind = keys: dispatcher: {
    _args = [
      keys
      (lua dispatcher)
      { mouse = true; }
    ];
  };
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    # UWSM owns the graphical session and its systemd targets.
    systemd.enable = false;

    settings = {
      # Let Hyprland choose the preferred mode for every connected display.
      # Machine-specific monitor layout can be added here later.
      monitor = {
        output = "";
        mode = "preferred";
        position = "auto";
        scale = 1;
      };

      config = {
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
      };

      bind = [
        (bind "${modifier} + RETURN" ''hl.dsp.exec_cmd("uwsm app -- ${terminal}")'')
        (bind "${modifier} + D" ''hl.dsp.exec_cmd("uwsm app -- ${menu}")'')
        (bind "${modifier} + Q" "hl.dsp.window.close()")
        (bind "${modifier} + M" ''hl.dsp.exec_cmd("uwsm stop")'')
        (bind "${modifier} + F" ''hl.dsp.window.fullscreen({ mode = "fullscreen" })'')
        (bind "${modifier} + SPACE" "hl.dsp.window.float()")

        (bind "${modifier} + H" ''hl.dsp.focus({ direction = "l" })'')
        (bind "${modifier} + L" ''hl.dsp.focus({ direction = "r" })'')
        (bind "${modifier} + K" ''hl.dsp.focus({ direction = "u" })'')
        (bind "${modifier} + J" ''hl.dsp.focus({ direction = "d" })'')

        (bind "${modifier} + 1" "hl.dsp.focus({ workspace = 1 })")
        (bind "${modifier} + 2" "hl.dsp.focus({ workspace = 2 })")
        (bind "${modifier} + 3" "hl.dsp.focus({ workspace = 3 })")
        (bind "${modifier} + 4" "hl.dsp.focus({ workspace = 4 })")
        (bind "${modifier} + 5" "hl.dsp.focus({ workspace = 5 })")
        (bind "${modifier} + SHIFT + 1" "hl.dsp.window.move({ workspace = 1 })")
        (bind "${modifier} + SHIFT + 2" "hl.dsp.window.move({ workspace = 2 })")
        (bind "${modifier} + SHIFT + 3" "hl.dsp.window.move({ workspace = 3 })")
        (bind "${modifier} + SHIFT + 4" "hl.dsp.window.move({ workspace = 4 })")
        (bind "${modifier} + SHIFT + 5" "hl.dsp.window.move({ workspace = 5 })")

        (mouseBind "${modifier} + mouse:272" "hl.dsp.window.drag()")
        (mouseBind "${modifier} + mouse:273" "hl.dsp.window.resize()")
      ];
    };
  };
}
