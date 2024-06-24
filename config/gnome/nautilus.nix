{username, ...}: {
  home-manager.users.${username} = {
    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "ptyxis";
    };
  };
}
