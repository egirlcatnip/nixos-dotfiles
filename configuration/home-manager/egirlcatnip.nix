{
  username,
  pkgs,
  ...
}: {
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    google-chrome
    vscode
  ];
  home.stateVersion = "23.11";
}
