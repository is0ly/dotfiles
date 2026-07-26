{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    systemd.enable = true;

    settings = {
      "font-family" = "IoskeleyMonoTerm Nerd Font SemiCondensed";
      "font-size" = 20;

      theme = "Gruvbox Dark Hard";

      "background-opacity" = 0.9;

      # fullscreen = true;
    };
  };
}
