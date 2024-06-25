{username, ...}: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.${username}.home.stateVersion = "23.11";
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
}
