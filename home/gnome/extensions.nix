{pkgs, ...}: {
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell
        dash-to-panel
        light-style
        noannoyance-fork
        tiling-assistant
        light-shell
      ];
    };
  };
}
