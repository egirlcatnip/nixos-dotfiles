{...}: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  imports = [
    # User set up in flake.nix, add additional manually
    ./main_user.nix
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ptyxis";
  };
}
