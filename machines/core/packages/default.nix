{...}: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./packages.nix
    ./system.nix
    ./flatpak.nix
    ./fonts.nix
  ];
}
