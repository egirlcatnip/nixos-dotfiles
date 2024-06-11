{...}: let
  username = "egirlcatnip";
in {
  home.stateVersion = "23.11"; # Do not change!

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = import ./${username}.nix;
}
