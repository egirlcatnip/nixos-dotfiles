{pkgs, ...}: {
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        dash-to-panel.extensionUuid
        tiling-assistant.extensionUuid
        luminus-shell-y.extensionUuid
        steal-my-focus-window.extensionUuid
        user-themes.extensionUuid
        appindicator.extensionUuid
        arcmenu.extensionUuid
        bluetooth-battery-meter.extensionUuid
        battery-health-charging.extensionUuid
        gnome-40-ui-improvements.extensionUuid
        fuzzy-app-search.extensionUuid
        dash-to-dock.extensionUuid
      ];
    };
  };
}
