{pkgs, ...}: let
  username = "egirlcatnip";
in {
  home.stateVersion = "23.11";
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    google-chrome
    firefox
  ];

  imports = [
  ];
}
