{
  description = "egirlcatnip's configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    nix-flatpak,
    nix-vscode-extensions,
    catppuccin,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      #atreides is the name of one configuration
      atreides = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # Place to configure the username
          ./configuration.nix

          # Configuration for the machine
          ./machines/atreides/atreides.nix
          #./configuration/home-manager

          # Tools used
          home-manager.nixosModules.home-manager
          nix-flatpak.nixosModules.nix-flatpak
          catppuccin.nixosModules.catppuccin
          nix-vscode-extensions.nixosModules.nix-vscode-extensions
        ];
      };
    };
  };
}
