{
  description = "egirlcatnip's configuration";

  inputs = {

    username = "egirlcatnip";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    nil.url = "github:oxalica/nil";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, username, nixpkgs, nixpkgs-unstable, nixos-hardware, nil, home-manager, ...  }@inputs:
  {
    nixosConfigurations.atreides = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
          inherit inputs;
        };

      modules = [
        ./machines/atreides/atreides.nix 
        ./packages

        


        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "home-manager-backup";
            users.${username} = import ./home.nix;
            extraSpecialArgs = {
              isNvidia = false;
              isHidpi = false;
              inherit inputs;
              };
            };
          }
      ];
    };

  };
}

