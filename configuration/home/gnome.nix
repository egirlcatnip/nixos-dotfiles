{...}: {
  programs.gnome-shell = {
    enable = false;

    theme = {
      name = "";
      package = "";
    };
  };

  dconf.enable = true;

  dconf.settings = {
    # Set windows buttons to MS Windows Style
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";

      resize-with-right-button = true;
    };

    # Desktop keybindings
    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      switch-windows = ["<Alt>Tab"];

      toggle-maximized = ["<Super>f" "<Super>Up"];
      toggle-fullscreen = ["<Ctrl><Super>f"];
      show-desktop = ["<Super>d"];
    };

    "org/gnome/shell/keybindings" = {
      screenshot = ["<Ctrl><Shift>s"];
      screenshot-window = ["<Ctrl><Shift><Alt>s"];
    };

    # Custom Keybindings
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0"
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1"
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2"
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Terminal";
      binding = "<Super>t";
      command = "xdg-terminal";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "";
      binding = "";
      command = "";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "";
      binding = "";
      command = "";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      name = "";
      binding = "";
      command = "";
    };
  };
}
