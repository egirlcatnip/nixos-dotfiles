{pkgs, ...}:
# Packages for all systems to share
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alejandra
    bat
    eza
    ffmpeg_7-full
    google-chrome

    git

    nh
    nixd
    ptyxis
    blackbox-terminal
    vscode
    armcord
    fastfetch
    starship

    zsh
    zoxide
    fzf
    gh
  ];

  services.xserver.excludePackages = [pkgs.xterm];
  environment.gnome.excludePackages = with pkgs; [
    gnome-connections # remote desktop
    gnome-console
    gnome-tour
    gnome.geary # mail
    gnome.gnome-contacts
    gnome.gnome-contacts
    gnome.gnome-maps
    gnome.gnome-music
    gnome.seahorse # passwords
    gnome.simple-scan # doc scan
    gnome.totem # gnome video player
    gnome.yelp # gnome help
  ];
}
