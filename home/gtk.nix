{
  pkgs,
  config,
  ...
}: {
  dconf.settings."org/gnome/desktop/interface" = {
    cursorTheme = "macOS-Monterey";
    gtk-theme = "adw-gtk3";
    iconTheme = "MoreWaita";
  };

  gtk = {
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    enable = true;

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
