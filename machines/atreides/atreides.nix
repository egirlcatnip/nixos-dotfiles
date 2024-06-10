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
  environment.gnome.excludePackages = with pkgs; [
    xterm

    gnome-tour
    gnome-maps
    gnome-music
    gnome-videos
    gnome-help
    gnome-extensions-app
    gnome-contacts
    gnome-connections
    gnome-contacts
  ];
}
