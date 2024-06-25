{username, ...}: {
  home-manager.users.${username} = {
    dconf.settings = {
      "org/gnome/nautilus/list-view".use-tree-view = true;
    };
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "ptyxis";
  };
}
