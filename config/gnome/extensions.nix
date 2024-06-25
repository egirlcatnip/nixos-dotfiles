{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs.gnomeExtensions; [
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
    quick-settings-tweaker
    steal-my-focus-window
    tiling-assistant
    user-themes
    media-controls
  ];

  home-manager.users.${username} = {
    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          arcmenu.extensionUuid
          battery-health-charging.extensionUuid
          bluetooth-battery-meter.extensionUuid
          blur-my-shell.extensionUuid
          dash-to-dock.extensionUuid
          #dash-to-panel.extensionUuid # Don't enable by default
          gnome-40-ui-improvements.extensionUuid
          luminus-shell-y.extensionUuid
          night-theme-switcher.extensionUuid
          quick-settings-tweaker.extensionUuid
          steal-my-focus-window.extensionUuid
          tiling-assistant.extensionUuid
          user-themes.extensionUuid
          media-controls.extensionUuid
        ];
      };
    };
  };
}
