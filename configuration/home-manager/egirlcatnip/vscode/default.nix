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

      naumovs.color-highlight
      usernamehw.errorlens
      #ionutvmi.path-autocomplete
      #qcz.text-power-tools
      #hideoo.toggler

      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      #dustypomerleau.rust-syntax

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
