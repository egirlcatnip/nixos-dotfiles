{pkgs, ...}: {
  home.stateVersion = "23.11";
  home.username = "egirlcatnip";
  home.homeDirectory = "/home/egirlcatnip";
  programs.home-manager.enable = true;

  imports = [
    ./vscode
  ];

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };

    cursorTheme = {
      name = "Apple Cursor";
      package = pkgs.apple-cursor;
    };
    iconTheme = {
      name = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };
  };

  programs.fastfetch = {
    enable = true;
  };
}
