{pkgs, ...}: {
  programs.gnome-shell = {
    enable = false;

    theme = {
      name = "";
      package = "";
    };
  };

  dconf = {
    enable = true;

    # Set windows buttons to MS Windows Style
    settings."org/gnome/desktop/wm/preferences".button-layout = ":minimize,maximize,close";
  };
}
