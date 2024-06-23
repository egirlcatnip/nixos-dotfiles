{pkgs, ...}: {
  # Packages shared by all systems
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-panel
    tiling-assistant
    luminus-shell-y
    steal-my-focus-window
    user-themes
    appindicator
    arcmenu
    bluetooth-battery-meter
    battery-health-charging
    gnome-40-ui-improvements
    dash-to-dock
    night-theme-switcher
  ];
}
