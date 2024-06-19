{
  username,
  dotfiles,
  ...
}: {
  home-manager.useGlobalPkgs = true;

  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.egirlcatnip = {
    imports = [
      ./egirlcatnip
    ];
  };
}
