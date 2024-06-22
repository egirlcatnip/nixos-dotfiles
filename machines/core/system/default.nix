{...}: {
  imports = [
    ./env.nix
    ./locale.nix
    ./shell.nix
    ./users.nix
    ./virt.nix
    ./boot.nix
  ];
  nix.settings.experimental-features = ["nix-command" "flakes"];
  xdg.portal.enable = true;
}
