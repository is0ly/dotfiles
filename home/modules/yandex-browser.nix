{ pkgs, ... }:

let
  yandexBrowser = pkgs.buildFHSEnv {
    name = "yandex-browser";

    targetPkgs =
      pkgs: with pkgs; [
        alsa-lib
        at-spi2-atk
        at-spi2-core
        atk
        cairo
        cups
        dbus
        expat
        fontconfig
        freetype
        glib
        gtk3
        libdrm
        libgbm
        libnotify
        libxkbcommon
        nspr
        nss
        pango
        systemd
        wayland
        zlib

        libx11
        libxcomposite
        libxcursor
        libxdamage
        libxext
        libxfixes
        libxi
        libxrandr
        libxrender
        libxtst
        libxcb
      ];

    runScript = pkgs.writeShellScript "yandex-browser-launcher" ''
      exec "$HOME/.local/opt/yandex-browser/opt/yandex/browser/yandex-browser" \
        --ozone-platform=wayland \
        "$@"
    '';
  };
in
{
  home.packages = [
    yandexBrowser
  ];

  xdg.desktopEntries.yandex-browser = {
    name = "Яндекс Браузер";
    genericName = "Web Browser";
    comment = "Яндекс Браузер";
    exec = "yandex-browser %U";
    terminal = false;

    categories = [
      "Network"
      "WebBrowser"
    ];

    mimeType = [
      "text/html"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
    ];
  };
}
