{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages =
    # Stable extensions
    (with pkgs.gnomeExtensions; [
      app-icons-taskbar
      appindicator
      arcmenu
      battery-health-charging
      bluetooth-battery-meter
      blur-my-shell
      dash-to-dock
      dash-to-panel
      gnome-40-ui-improvements
      just-perfection
      light-style
      media-controls
      night-theme-switcher
      quick-settings-audio-devices-renamer
      quick-settings-audio-devices-renamer
      tiling-assistant
      user-themes
    ])
    # Unstable extensions
    ++ (with pkgs.unstable.gnomeExtensions; [
      quick-settings-tweaker
      hide-the-dock-in-overview
    ]);

  home-manager.users.${username} = {
    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions =
          # Stable extensions
          (with pkgs.gnomeExtensions; [
            app-icons-taskbar.extensionUuid
            appindicator.extensionUuid
            battery-health-charging.extensionUuid
            bluetooth-battery-meter.extensionUuid
            blur-my-shell.extensionUuid
            gnome-40-ui-improvements.extensionUuid
            just-perfection.extensionUuid
            light-style.extensionUuid
            media-controls.extensionUuid
            night-theme-switcher.extensionUuid
            quick-settings-audio-devices-renamer.extensionUuid
            quick-settings-audio-devices-renamer.extensionUuid
            steal-my-focus-window.extensionUuid
            tiling-assistant.extensionUuid
            user-themes.extensionUuid

            # dash-to-dock.extensionUuid     # Don't enable by default
            # dash-to-panel.extensionUuid    # Don't enable by default
            # arcmenu.extensionUuid          # Don't enable by default
          ])
          # Untable extensions
          ++ (with pkgs.unstable.gnomeExtensions; [
            quick-settings-tweaker.extensionUuid
            hide-the-dock-in-overview.extensionUuid
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
        workspace-switcher-should-show = true;
        window-demands-attention-focus = true;
        events-button = false;
      };

      "org/gnome/shell/extensions/aztaskbar" = {
        panel-location = "BOTTOM";
      };

      "org/gnome/shell/extensions/mediacontrols" = {
        extension-position = "Right";
      };
    };
  };
}
