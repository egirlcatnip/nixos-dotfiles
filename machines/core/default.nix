{ pkgs, ... }:

# Import global configuration
{
  imports = [
    ./boot.nix
    ./users.nix
    ./locale.nix
    ./desktop.nix
    ./audio.nix
    ./networking.nix
    ./layout.nix
    ./packages.nix 
    ./cleanup.nix
  ];


  nixpkgs.config.allowUnfree = true;

}