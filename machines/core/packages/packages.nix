{pkgs, ...}: {
  # Packages shared by all systems
  environment.systemPackages = with pkgs; [
    # Main browser
    google-chrome
    #chromium
    #firefox

    #Text editor/IDE
    vscode

    # Theming
    gnome.adwaita-icon-theme
    adw-gtk3
    apple-cursor

    # Gnome related
    gnome-extension-manager
    gnome.dconf-editor

    # Gnome extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-panel
  ];

  # Exclusions
  services.xserver.excludePackages = [pkgs.xterm];
  environment.gnome.excludePackages = with pkgs; [
    gnome-connections # remote desktop
    gnome-console
    gnome-tour
    gnome.geary # mail
    gnome.gnome-contacts
    gnome.gnome-maps
    gnome.gnome-music
    gnome.seahorse # passwords
    gnome.simple-scan # doc scan
    gnome.totem # gnome video player
    gnome.yelp # gnome help
  ];
}
