{
  #dotfiles,
  #nix-vscode-extensions,
  pkgs,
  config,
  ...
}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    mutableExtensionsDir = true;

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
      bodil.file-browser
      #dustypomerleau.rust-syntax
      kamadorueda.alejandra
      jnoortheen.nix-ide
    ];
  };

  /*
  home.file = {
    ".config/Code/User/keybindings.json" = {
      source = ./keybindings.json;
      recursive = true;
    };
  };

  home.file = {
    ".config/Code/User/settings.json" = {
      source = ./settings.json;
      recursive = true;
    };
  };
  */
}
