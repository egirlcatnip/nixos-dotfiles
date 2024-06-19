{
  #dotfiles,
  #nix-vscode-extensions,
  pkgs,
  ...
}: let
  #marketplace = nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace;
  #marketplace-release = nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace-release;
in {
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

    /*
    ++ (with marketplace; [
      ionutvmi.path-autocomplete
      qcz.text-power-tools
      hideoo.toggler
      dustypomerleau.rust-syntax
    ]);
    */
  };
 
  
  home.file = {
    ".config/Code/User/keybindings.json" = {
      #source = "${dotfiles}/.config/Code/User/keybindings.json";
      source = ./keybindings.json;
    };
    };
   
   home.file = {
    ".config/Code/User/settings.json" = {

      source =./settings.json;
    };
  };
  
  
}
