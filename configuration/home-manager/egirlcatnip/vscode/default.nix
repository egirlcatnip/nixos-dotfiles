{
  pkgs,
  dotfiles,
  ...
}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons

      kamadorueda.alejandra
      jnoortheen.nix-ide
    ];
  };

  home.file = {
    ".config/Code/User/keybindings.json" = {
      source = ./keybindings.json;
    };

    ".config/Code/User/settings.json" = {
      source = ./settings.json;
    };
  };
}
