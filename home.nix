# This needs to be redone!


{ inputs, lib, pkgs, osConfig, ... }:
let
  hostName = osConfig.networking.hostName;

  imports = [
    # ./home/starship.nix
  ];

in {
  home = {
    stateVersion = "23.05";

    packages = with pkgs; [
      galaxy-buds-client
    ];  
   
  };
  inherit imports;
    
  nixpkgs.config = {
    allowUnfree = true;
  };


  programs = {
    vscode = {
      enable = true;
    };
    zoxide = {
      enable = true;
    };

  };
   

}