{pkgs, ...}: {
  home.stateVersion = "23.11";
  home.username = "egirlcatnip";
  home.homeDirectory = "/home/egirlcatnip";
  programs.home-manager.enable = true;

  imports = [
    ./vscode
    ./gtk.nix
  ];

  programs.fastfetch = {
    enable = true;
  };
}
