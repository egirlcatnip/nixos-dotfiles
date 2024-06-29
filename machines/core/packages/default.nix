{inputs, ...}: {
  # Packages are defined either in the following modules or next to their configurations in /config/application
  imports = [
    ./system.nix
    ./flatpak.nix
    ./fonts.nix
    ./dynamic.nix
  ];

  # Allow non-open-source applications (eg. Visual Studio Code, Discord, Google Chrome... )
  nixpkgs.config.allowUnfree = true;

  # Enable wayland for chrome and electron
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Overlay for unstable packages
  # environment.systemPackages = with pkgs; [unstable.package]
  nixpkgs.overlays = [
    (final: prev: {
      unstable = import inputs.nixpkgs-unstable {
        system = prev.system;
        config.allowUnfree = true;
      };
    })
  ];
}
