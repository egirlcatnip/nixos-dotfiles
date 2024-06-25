{username, ...}: {
  home-manager.users.${username} = {
    home.file = {
      ".config/fastfetch/" = {
        source = "${dotfiles}/.config/fastfetch";
      };
    };
  };
}
