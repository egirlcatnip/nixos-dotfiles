{nixpkgs-unstable, ...}: {
  # Packages are defined either in the following modules or next to their configurations in /config/application
  imports = [
    ./system.nix
    ./flatpak.nix
    ./fonts.nix
  ];

  # Allow non-open-source applications (eg. Visual Studio Code, Discord, Google Chrome... )
  nixpkgs.config.allowUnfree = true;

  # Overlay for unstable packages
  # environment.systemPackages = with pkgs; [unstable.package]
  nixpkgs.overlays = [
    (final: prev: {
      unstable = import nixpkgs-unstable {
        system = prev.system;
      };
    })
  ];
}
