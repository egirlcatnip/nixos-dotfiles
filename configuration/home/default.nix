{
  username,
  dotfiles,
  ...
}: {
  home-manager.useGlobalPkgs = true;

  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.${username} = {
    imports = [
      ./vscode
      ./gtk.nix
      ./gnome.nix
      ./chrome.nix
    ];

    home.stateVersion = "23.11";
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";
    programs.home-manager.enable = true;

    # Fastfetch
    home.file = {
      ".config/fastfetch/" = {
        source = "${dotfiles}/.config/fastfetch";
      };
    };

    # Starship
    home.file = {
      ".config/starship/" = {
        source = "${dotfiles}/.config/starship";
      };
    };
  };
}
