{pkgs, ...}: {
  imports = [
    ./../core # Global configs for all systems
    ./hardware.nix # Disk layout *only* for "atreides"
    ./packages.nix # Packages *only* for "atreides"
  ];
  system.stateVersion = "23.11"; # Do not edit

  networking.hostName = "atreides";

  # Hardware specific options:
  services.thermald.enable = true;
  zramSwap.enable = true;

  # Choose only one bootloader!
  grub.enable = true;
  boot.loader.grub.device = "nodev"; # USE YOUR OWN!!
  systemdboot.enable = false;

  #Enable custom boot-entry label
  custom_nixos_label.enable = true;

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

  # Theming
  theming.enable = true;

  # Personal Gnome configuration:

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
