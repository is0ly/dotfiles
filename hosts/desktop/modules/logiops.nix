# { ... }:
#
# {
#   hardware.uinput.enable = true;
#
#   services.evremap.enable = false;
#
#   services.logiops = {
#     enable = true;
#
#     config = {
#       devices = [
#         {
#           name = "MX Master 4";
#
#           buttons = [
#             {
#               cid = 195; # 0xc3 — проверенная верхняя кнопка
#
#               action = {
#                 type = "Keypress";
#                 keys = [
#                   "KEY_LEFTMETA"
#                   "BTN_MIDDLE"
#                 ];
#               };
#             }
#           ];
#         }
#       ];
#     };
#   };
# }
#
#
#
#
{ ... }:

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
}
