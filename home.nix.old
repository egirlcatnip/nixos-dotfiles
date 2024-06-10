# This needs to be redone!


{ inputs, lib, pkgs, osConfig, ... }:
let
  hostName = osConfig.networking.hostName;

  imports = [
    # ./home/starship.nix
  ];

in {
  home = {
    stateVersion = "23.11";

    packages = with pkgs; [
      galaxy-buds-client
    ];  
   
  };
  inherit imports;

  programs = {
    vscode = {
      enable = true;
    };
    zoxide = {
      enable = true;
    };

  };
   

}