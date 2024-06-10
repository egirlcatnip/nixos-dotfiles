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





  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-hardware, nil, home-manager, ...  }:
  
  let
  username = "egirlcatnip";

  system = "x86_64-linux";
  lib = nixpkgs.lib;
  
  pkgs = nixpkgs.legacyPackages.${system};
  pkgs-unstable = nixpkgs-unstable.legacyPackages .${system};
  
  in
  {
    

    #atreides is the machine/its' hostname (see /machines)
    nixosConfigurations = {
      atreides = lib.nixosSystem {
        

        nixpkgs.config.allowUnfree = true;


        system = "${system}";
      
        modules = [
         ./machines/atreides/atreides.nix
        	
          
          # ./home.nix # todo!
        ];
        specialArgs = {
          inherit username;
          inherit pkgs;
          inherit pkgs-unstable;
        };
      };   
    };
  };
  
  
}