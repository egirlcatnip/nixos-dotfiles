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
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Terminal";
      binding = "<Super>t";
      command = "ptyxis";
    };

    # Fonts
    "/org/gnome/desktop/interface/" = {
      font-name = "JetBrainsMono NF 11";
      document-font-name = "JetBrainsMono NF 11";
      monospace-font-name = "JetBrainsMono NF 11";
    };
  };
}
