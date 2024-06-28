{
  description = "egirlcatnip's configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    catppuccin.url = "github:catppuccin/nix";
    nix-ld.url = "github:Mic92/nix-ld";
    nix-alien.url = "github:thiagokokada/nix-alien";
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    nix-flatpak,
    #nix-vscode-extensions,
    catppuccin,
    home-manager,
    nix-ld,
    ...
  }: {
    nixosConfigurations = {
      atreides = nixpkgs.lib.nixosSystem {
        specialArgs = {
          username = "egirlcatnip";
          dotfiles = ./dotfiles;
          system = "x86_64-linux";
          inherit inputs nixpkgs-unstable;
        };

        modules = [
          # Zephyrus G14 2022
          nixos-hardware.nixosModules.asus-zephyrus-ga402

          # Machine specific configuration
          ./machines/atreides

          # Configurations
          ./config

          # Tools used
          home-manager.nixosModules.home-manager
          nix-flatpak.nixosModules.nix-flatpak
          catppuccin.nixosModules.catppuccin
          nix-ld.nixosModules.nix-ld
        ];
      };
    };
  };
}
