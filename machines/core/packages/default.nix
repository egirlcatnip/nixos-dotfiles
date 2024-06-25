{nixpkgs-unstable, ...}: {
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
