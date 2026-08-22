{ pkgs, ... }:

{
  hardware.uinput.enable = true;

  services.evremap.enable = false;

  services.logiops = {
    enable = true;

    config = {
      devices = [
        {
          name = "MX Master 4";

          hiresscroll = {
            hires = true;
            invert = true;
            target = false;
          };

          buttons = [
            {
              # Удержание + движение = нативный drag в Niri.
              cid = 195; # 0xc3 — Mouse Gesture Button

              action = {
                type = "Keypress";
                keys = [
                  "KEY_LEFTMETA"
                  "BTN_MIDDLE"
                ];
              };
            }

            {
              # Назад в браузере, файловом менеджере и других приложениях.
              cid = 83; # 0x53 — Back Button

              action = {
                type = "Keypress";
                keys = [
                  "BTN_BACK"
                ];
              };
            }

            {
              # Вперёд в браузере, файловом менеджере и других приложениях.
              cid = 86; # 0x56 — Forward Button

              action = {
                type = "Keypress";
                keys = [
                  "BTN_FORWARD"
                ];
              };
            }
          ];
        }
      ];
    };
  };

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="hid", ENV{HID_ID}=="0005:0000046D:0000B042", TAG+="systemd", ENV{SYSTEMD_WANTS}+="logid-restart.service"
  '';

  systemd.services.logid-restart = {
    description = "Restart logid once the mouse hidraw device shows up";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/systemctl restart logid.service";
    };
  };
}
