{username, ...}: {
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
          #dash-to-panel.extensionUuid
          #duckduckgo-search-provider.extensionUuid
          gnome-40-ui-improvements.extensionUuid
          luminus-shell-y.extensionUuid
          night-theme-switcher.extensionUuid
          #overview-hover.extensionUuid
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
