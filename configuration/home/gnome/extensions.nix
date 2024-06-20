{pkgs, ...}: {
  programs.gnome-shell.extensions = with pkgs.gnomeExtensions; [
    {package = dash-to-panel;}
    {package = blur-my-shell;}
  ];

  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        dash-to-panel.extensionUuid
        light-style.extensionUuid
      ];
    };
  };
}
