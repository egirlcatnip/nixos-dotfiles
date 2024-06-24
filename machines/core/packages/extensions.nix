{pkgs, ...}: {
  # Packages shared by all systems
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
}
