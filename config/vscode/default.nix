{...}: let
  settings = ./settings.json;
  keybindigns = ./keybindings.json;
  settings-path = "~/.config/Code/User/settings.json";
  keybindings-path = "~/.config/Code/User/keybindings.json";
in {
  systemd.tmpfiles.rules = [
    "C ${settings-path}  -  -  -  -  ${settings}"
    "C ${keybindings-path}  -  -  -  -  ${keybindings}"
  ];
}
