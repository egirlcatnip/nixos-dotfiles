{
  description = "egirlcatnip's configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    flatpaks.url = "github:GermanBread/declarative-flatpak/stable";

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
    flatpaks,
    catppuccin,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      #atreides is the name of one configuration
      atreides = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./machines/atreides/atreides.nix
          flatpaks.nixosModules.default
          catppuccin.nixosModules.catppuccin

          # ./home.nix # todo!
        ];
      };
    };
  };
}
