{username, ...}: {
  imports = [
    ./extensions.nix
    ./keybindings.nix
    ./fonts.nix
    ./gtk.nix
    ./nautilus
  ];

  home-manager.users.${username} = {
    dconf.enable = true;

    dconf.settings = {
      "org/gnome/desktop/wm/preferences" = {
        # Set windows buttons to MS Windows Style
        button-layout = ":minimize,maximize,close";
        resize-with-right-button = true;
      };
    };
  };
}
