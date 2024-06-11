{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions;
      [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons

        kamadorueda.alejandra
        jnoortheen.nix-ide
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "path-autocomplete";
          publisher = "ionutvmi";
          version = "1.25.0";
          sha256 = "sha256-iz32o1znwKpbJSdrDYf+GDPC++uGvsCdUuGaQu6AWEo=";
        }
      ];
  };

  home.file = {
    ".config/Code/User" = {
      source = ./../../../dotfiles/.config/Code/User;
    };
  };
}
