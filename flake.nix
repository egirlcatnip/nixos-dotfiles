{
  description = "egirlcatnip's configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    nil.url = "github:oxalica/nil";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-hardware, nil, home-manager, ...  }@inputs:
  
  let
  username = "egirlcatnip";
  
  in {
    #atreides is the machine/its' hostname (see /machines)
    nixosConfigurations.atreides = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
          inherit inputs;
        };

      modules = [
        ./machines/atreides/atreides.nix 
        # ./packages    # Here, packages will live
        

        # Not sure about home manager yet, this is stolen from elsewhere:
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

