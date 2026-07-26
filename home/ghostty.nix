{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    systemd.enable = true;

    settings = {
      "font-family" = "Iosevka Nerd Font Mono";
      "font-size" = 14;

      theme = "Catppuccin Mocha";

      background = "1e1e2e";
      "background-opacity" = 0.90;

      "window-padding-x" = 16;
      "window-padding-y" = 12;
      "window-padding-balance" = true;

      "window-decoration" = "none";
      "window-show-tab-bar" = "never";

      "cursor-style" = "block";
      "cursor-style-blink" = false;

      "shell-integration" = "zsh";
      "shell-integration-features" = "cursor,sudo,title";
    };
  };
}
