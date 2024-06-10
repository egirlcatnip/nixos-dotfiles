{pkgs, ...}: {
  imports = [
    ./../core # Global configs for all systems
    ./hardware.nix # Disk layout *only* for "atreides"
    ./packages.nix # Packages *only* for "atreides"
  ];

  networking.hostName = "atreides";

  # Hardware specific options:
  services.thermald.enable = true;
  zramSwap.enable = true;

  system.stateVersion = "23.11"; # Do not edit

  # Choose only one bootloader!
  grub.enable = false;
  systemdboot.enable = true;

  # Plymouth
  plymouth.enable = true;

  # Silent Boot
  silent_boot.enable = true;

  # Choose only one Desktop Enviroment
  gnome.enable = true;
  kde.enable = false;

  ## Personal configuraiton

  # Enable my personal keyboard layout
  layout.enable = true;

  # Personal Gnome configuration:

  services.xserver.excludePackages = [pkgs.xterm];
  environment.gnome.excludePackages = with pkgs; [
    gnome-connections # remote desktop
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
