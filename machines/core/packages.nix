{pkgs, ...}:
# Packages for all systems to share
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alejandra
    armcord
    bat
    btop
    eza
    fastfetch
    ffmpeg_7-full
    fzf
    gh
    git
    gnome.adwaita-icon-theme
    google-chrome
    nh
    nixd
    ptyxis
    rocmPackages.rocm-smi
    starship
    vscode
    zoxide
    zsh
    gnome-extension-manager
    gnome.dconf-editor

    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-panel
  ];

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
