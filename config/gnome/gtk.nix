{
  username,
  pkgs,
  ...
}: {
  home-manager.users.${username} = {
    dconf.settings."org/gnome/desktop/interface" = {
      cursorTheme = "macOS-Monterey";
      gtk-theme = "adw-gtk3";
      iconTheme = "MoreWaita";
    };
  };

  environment.systemPackages = with pkgs; [
    apple-cursor
    morewaita-icon-theme
    adw-gtk3
  ];
}
