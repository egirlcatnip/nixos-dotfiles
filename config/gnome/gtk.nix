{
  username,
  pkgs,
  ...
}: {
  home-manager.users.${username} = {
    dconf.settings."org/gnome/desktop/interface" = {
      cursor-theme = "macOS-Monterey";
      gtk-theme = "adw-gtk3";
      icon-theme = "MoreWaita";
    };
  };

  environment.systemPackages = with pkgs; [
    apple-cursor
    morewaita-icon-theme
    adw-gtk3
  ];
}
