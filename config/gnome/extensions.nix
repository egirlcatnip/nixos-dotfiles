{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages =
    # Stable extensions
    (with pkgs.gnomeExtensions; [
      appindicator
      arcmenu
      battery-health-charging
      bluetooth-battery-meter
      blur-my-shell
      dash-to-dock
      dash-to-panel
      gnome-40-ui-improvements
      luminus-shell-y
      night-theme-switcher
      tiling-assistant
      user-themes
      media-controls
      just-perfection
      app-icons-taskbar
      quick-settings-audio-devices-renamer
    ])
    # Unstable extensions
    ++ (with pkgs.unstable.gnomeExtensions; [
      quick-settings-tweaker
    ]);

  home-manager.users.${username} = {
    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions =
          # Stable extensions
          (with pkgs.gnomeExtensions; [
            #appindicator.extensionUuid
            battery-health-charging.extensionUuid
            bluetooth-battery-meter.extensionUuid
            blur-my-shell.extensionUuid
            dash-to-dock.extensionUuid
            # dash-to-panel.extensionUuid # Don't enable by default
            # arcmenu.extensionUuid # Don't enable by default
            gnome-40-ui-improvements.extensionUuid
            luminus-shell-y.extensionUuid
            night-theme-switcher.extensionUuid
            steal-my-focus-window.extensionUuid
            tiling-assistant.extensionUuid
            user-themes.extensionUuid
            media-controls.extensionUuid
            just-perfection.extensionUuid
            app-icons-taskbar.extensionUuid
            quick-settings-audio-devices-renamer.extensionUuid
          ])
          # Untable extensions
          ++ (with pkgs.unstable.gnomeExtensions; [
            quick-settings-tweaker.extensionUuid
          ]);
      };

      "org/gnome/shell/extensions/Battery-Health-Charging" = {
        show-notifications = false;
        show-system-indicator = false;
      };
      "org/gnome/shell/extensions/gnome-ui-tune" = {
        restore-thumbnails-background = false;
      };

      "org/gnome/shell/extensions/just-perfection" = {
        switcher-popup-delay = true;
        windows-preview-caption = false;
        #dash = false;
        workspace-switcher-should-show = true;
        window-demands-attention-focus = true;
        events-button = false;
      };

      "org/gnome/shell/extensions/aztaskbar" = {
        panel-location = "BOTTOM";
      };
    };
  };
}
