{...}:
# Import global configuration
{
  imports = [
    ./audio.nix
    ./boot.nix
    ./desktop.nix
    ./env.nix
    ./flatpak.nix
    ./fonts.nix
    ./layout.nix
    ./locale.nix
    ./mime.nix
    ./networking.nix
    ./packages.nix
    ./shell.nix
    ./theming.nix
    ./users.nix
    ./virtualization.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  xdg.portal.enable = true;
}
