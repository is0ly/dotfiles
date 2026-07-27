{ ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "IoskeleyMonoTerm Nerd Font SemiCondensed:size=12";
        terminal = "foot";
        layer = "overlay";
        width = 40;
      };

      colors = {
        background = "1d2021eb";
        text = "ebdbb2ff";
        match = "fabd2fff";
        selection = "504945ff";
        selection-text = "fbf1c7ff";
        border = "d79921ff";
      };

      border = {
        width = 2;
        radius = 8;
      };
    };
  };
}
