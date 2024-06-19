{...}:
# Import global configuration
{
  imports = [
    ./audio.nix
    ./boot.nix
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
    ./fonts.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
