{username, ...}: {
  home-manager.users.${username} = {
    dconf.settings = {
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
        home = ["<Super>e"];

        www = ["<Super>b"];

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
  };
}
