{...}: {
  imports = [
    ./../core # Global configs for all systems
    ./hardware.nix # Disk layout *only* for "atreides"
    ./packages.nix # Packages *only* for "atreides"
  ];
  system.stateVersion = "23.11"; # Do not edit

  networking.hostName = "atreides";

  # Hardware specific options:
  services.thermald.enable = true;
  services.auto-cpufreq.enable = true;
  services.fstrim.enable = true;

  zramSwap.enable = true;

  # Choose only one bootloader!
  grub.enable = true;
  boot.loader.grub.device = "nodev"; # USE YOUR OWN!!

  systemdboot.enable = false;

  # Plymouth
  silentboot.enable = true;
  boot.kernelModules = ["kvm-amd"];

  # Choose only one Desktop Enviroment
  gnome.enable = true;
  kde.enable = false;

  ## Personal configuraiton
  # Enable my personal keyboard layout
  layout.enable = true;

  # Theming
  theming.enable = true;
}
