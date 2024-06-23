{pkgs, ...}: {
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        dash-to-panel.extensionUuid
        light-style.extensionUuid
        noannoyance-fork.extensionUuid
        tiling-assistant.extensionUuid
        light-shell.extensionUuid
      ];
    };
  };
}
