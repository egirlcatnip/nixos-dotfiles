{
  username,
  dotfiles,
  ...
}: {
  home-manager.useGlobalPkgs = true;

  home-manager.useUserPackages = true;

  home-manager.users.egirlcatnip = {
    imports = [
      ./egirlcatnip
    ];
  };
}
