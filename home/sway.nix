{ ... }:

{
  wayland.windowManager.sway = {
    enable = true;

    config = {
      startup = [
        {
          command = "waybar";
          always = true;
        }
      ];

      # Отключаем встроенный нижний swaybar.
      bars = [ ];

      gaps = {
        inner = 6;
        outer = 6;
      };

      window = {
        border = 0;
        titlebar = false;
      };

      floating = {
        border = 0;
        titlebar = false;
      };

      colors = {
        focused = {
          border = "#1e1e2e";
          background = "#1e1e2e";
          text = "#cdd6f4";
          indicator = "#1e1e2e";
          childBorder = "#1e1e2e";
        };

        focusedInactive = {
          border = "#1e1e2e";
          background = "#1e1e2e";
          text = "#a6adc8";
          indicator = "#1e1e2e";
          childBorder = "#1e1e2e";
        };

        unfocused = {
          border = "#1e1e2e";
          background = "#1e1e2e";
          text = "#6c7086";
          indicator = "#1e1e2e";
          childBorder = "#1e1e2e";
        };

        urgent = {
          border = "#f38ba8";
          background = "#1e1e2e";
          text = "#cdd6f4";
          indicator = "#f38ba8";
          childBorder = "#f38ba8";
        };
      };
    };
  };
}
