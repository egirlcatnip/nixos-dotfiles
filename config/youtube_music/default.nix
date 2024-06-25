{username, ...}: {
  home-manager.users.${username} = {
    home.file = {
      ".config/YouTube Music/config.json" = {
        source = "${dotfiles}/.config/YouTube Music/config.json";
      };
    };
  };
}
