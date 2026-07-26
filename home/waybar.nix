{ ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        height = 24;
        spacing = 0;

        modules-left = [
          "niri/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [ ];

        "niri/workspaces" = {
          format = "{index}";
          current-only = true;
          disable-click = false;
        };

        clock = {
          format = "{:%H:%M}";
          tooltip = false;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        min-height: 0;

        font-family: "JetBrainsMono Nerd Font Mono";
        font-size: 11px;
        font-weight: 500;
      }

      window#waybar {
        background: rgba(29, 32, 33, 0.92);
        color: #ebdbb2;
      }

      #workspaces {
        margin-left: 6px;
      }

      #workspaces button {
        min-width: 18px;
        padding: 0 6px;
        margin: 0;

        color: #928374;
        background: transparent;
      }

      #workspaces button.focused,
      #workspaces button.active {
        color: #fabd2f;
        background: transparent;
      }

      #workspaces button.urgent {
        color: #fb4934;
        background: transparent;
      }

      #workspaces button:hover {
        color: #fbf1c7;
        background: rgba(235, 219, 178, 0.08);

        box-shadow: none;
        text-shadow: none;
      }

      #clock {
        color: #ebdbb2;
        padding: 0 8px;
      }
    '';
  };
}
