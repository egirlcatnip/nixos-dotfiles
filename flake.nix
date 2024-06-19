{
  description = "egirlcatnip's configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    catppuccin.url = "github:catppuccin/nix";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
  };

  outputs = inputs @ {
    nixpkgs,
    #nixpkgs-unstable,
    #nixos-hardware,
    nix-flatpak,
    nix-vscode-extensions,
    catppuccin,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      #atreides is the name of one configuration
      atreides = nixpkgs.lib.nixosSystem {
        specialArgs = {
          username = "egirlcatnip";
          dotfiles = ./dotfiles;
          system = "x86_64-linux";
        };

        modules = [
          # Configuration for the machine
          ./machines/atreides/atreides.nix
          # ~ Configuration for the machine
          ./configuration

          # Tools used
          home-manager.nixosModules.home-manager
          nix-flatpak.nixosModules.nix-flatpak
          catppuccin.nixosModules.catppuccin
        ];
      };
    };
  };
}
