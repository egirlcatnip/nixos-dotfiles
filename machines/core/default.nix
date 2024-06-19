{...}:
# Import global configuration
{
  imports = [
    ./audio.nix
    ./boot.nix
    ./cleanup.nix
    ./desktop.nix
    ./flatpak.nix
    ./layout.nix
    ./locale.nix
    ./networking.nix
    ./packages.nix
    ./theming.nix
    ./users.nix
    ./shell.nix
    ./env.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
