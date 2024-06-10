{ ... }:

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
  ];

}