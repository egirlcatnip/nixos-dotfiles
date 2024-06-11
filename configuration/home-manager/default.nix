{config, ...}: let
  username = "egirlcatnip";
in {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = import ./${username}/default.nix;
}
