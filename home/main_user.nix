{
  username,
  dotfiles,
  ...
}: {
  home-manager.users.${username} = {
    imports = [
      ./vscode
      ./gtk.nix
      ./gnome
      ./chrome.nix
    ];

    home.stateVersion = "23.11";
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";

    # programs.home-manager.enable = true;

    # Fastfetch
    home.file = {
      ".config/fastfetch/" = {
        source = "${dotfiles}/.config/fastfetch";
      };
    };

    # YT Music
    home.file = {
      ".config/YouTube Music/config.json" = {
        source = "${dotfiles}/.config/YouTube Music/config.json";
      };
    };
  };
}
