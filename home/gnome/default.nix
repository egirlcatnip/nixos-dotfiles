{...}: {
  imports = [
    ./extensions.nix
  ];

  dconf.enable = true;

  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      # Set windows buttons to MS Windows Style
      button-layout = ":minimize,maximize,close";
      resize-with-right-button = true;
    };

    # Fonts
    "org/gnome/desktop/interface" = {
      font-name = "JetBrainsMono Nerd Font 11";
      document-font-name = "JetBrainsMono Nerd Font 11";
      monospace-font-name = "JetBrainsMono Nerd Font 11";
    };

    # Desktop keybindings
    "org/gnome/desktop/wm/keybindings" = {
      switch-windows = ["<Alt>Tab"];
      close = ["<Super>q"];

      toggle-maximized = ["<Super>f" "<Super>Up"];
      toggle-fullscreen = ["<Ctrl><Super>f"];
      show-desktop = ["<Super>d"];
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = ["<Super><Shift>s"];
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
      command = "xdg-terminal-exec";
    };
  };
}
