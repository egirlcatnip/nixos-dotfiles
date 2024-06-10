{
  description = "egirlcatnip's configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    nil.url = "github:oxalica/nil";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    

  };


  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-hardware, nil, home-manager, ...  }@inputs:
  
  {

    

    #atreides is the machine/its' hostname (see /machines)
    nixosConfigurations.atreides = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      
       
      modules = [
        ./machines/atreides/atreides.nix 
        # ./packages    # Here, packages will live
      ];
    };

  };
}

