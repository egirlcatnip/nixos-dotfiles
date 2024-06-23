{
  pkgs,
  config,
  ...
}: {
  gtk = {
    enable = true;

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    /*
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
    */
    cursorTheme = {
      name = "macOS-Monterey";
      size = 12;
      package = pkgs.apple-cursor;
    };

    iconTheme = {
      name = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };
  };
}
