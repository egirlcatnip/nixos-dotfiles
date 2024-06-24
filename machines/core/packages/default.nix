{nixpkgs-unstable, ...}: {
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (final: prev: {
      unstable = import nixpkgs-unstable {
        system = prev.system;
      };
    })
  ];

  imports = [
    ./packages.nix
    ./system.nix
    ./flatpak.nix
    ./fonts.nix

    ./extensions.nix
  ];
}
