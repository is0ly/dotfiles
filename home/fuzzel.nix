{ ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "Iosevka Nerd Font:size=12";
        terminal = "foot";
        layer = "overlay";
        width = 40;
      };

      colors = {
        background = "1e1e2eee";
        text = "cdd6f4ff";
        match = "89b4faff";
        selection = "313244ff";
        selection-text = "cdd6f4ff";
        border = "89b4faff";
      };

      border = {
        width = 2;
        radius = 8;
      };
    };
  };
}
