{pkgs, ...}: {
  programs.gnome-shell = {
    enable = false;

    theme = {
      name = "";
      package = "";
    };

    dconf = {
      enable = true;
      settings."org/gnome/desktop/wm/preferences" = "minimize,maximize,close";
    };
  };
}
