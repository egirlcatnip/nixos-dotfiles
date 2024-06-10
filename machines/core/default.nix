{pkgs, ...}:
# Import global configuration
{
  imports = [
    ./audio.nix
    ./autoupdate.nix
    ./boot.nix
    ./cleanup.nix
    ./desktop.nix
    ./layout.nix
    ./locale.nix
    ./networking.nix
    ./packages.nix
    ./theming.nix
    ./users.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
