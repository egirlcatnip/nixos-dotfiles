{ ... }:

{
  imports = [
    ./../core        # Global configs for all systems
    ./hardware.nix   # Disk layout *only* for "atreides"
  ];

  networking.hostName = "atreides";

  ## Enable specific modules of global configuration

  # Choose only one bootloader!
  grub.enable = false;
  systemdboot.enable = true;

  # Choose only one Desktop Enviroment
  gnome.enable = true;
  kde.enable = false;

  # Enable my personal keyboard layout
  layout.enable = true;


  # System specific options:

  services.thermald.enable = true;



  system.stateVersion = "23.11"; # Do not edit
}