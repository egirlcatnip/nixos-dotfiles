{
  username,
  dotfiles,
  pkgs,
  ...
}: let
  settings_path = ".config/Code/User/settings.json";
  keybindings_path = ".config/Code/User/keybindings.json";

  settings = "${dotfiles}/${settings_path}";
  keybindings = "${dotfiles}/${keybindings_path}";
in {
  environment.systemPackages = with pkgs; [vscode];

  home-manager.users.${username} = {
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

    home.file = {
      "${keybindings_path}".source = keybindings;
    };

    home.file = {
      "${settings_path}".source = settings;
    };
  };
}
