{ username, pkgs, lib, config, ... }:



# Import global configuration
{
  imports = [
    ./boot.nix
    ./layout.nix
    ./desktop_enviroment.nix
    ./networking.nix
    ./audio.nix
    ./users.nix
    ./locale.nix
    ./nix.nix

  ];

}