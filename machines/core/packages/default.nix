{
  config,
  nixpkgs-unstable,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./packages.nix
    ./system.nix
    ./flatpak.nix
    ./fonts.nix
    ./extensions.nix
  ];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = nixpkgs-unstable {
        config = config.nixpkgs.config;
      };
    };
  };
}
