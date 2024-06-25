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
  services.auto-cpufreq.enable = true;
  services.fstrim.enable = true;
  zramSwap.enable = true;

  # Choose only one bootloader!
  grub.enable = true;
  systemdboot.enable = false;

  # Plymouth and silent booting
  silentboot.enable = true;

  # Choose only one Desktop Enviroment
  gnome.enable = true;
  kde.enable = false;

  ## Personal configuraiton
  # Enable my personal keyboard layout
  layout.enable = true;

  # Theming
  theming.enable = true;

  # Hardware acceleration
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
