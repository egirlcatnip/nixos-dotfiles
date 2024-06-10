{ pkgs, ... }:

# Import global configuration
{
  imports = [
    ./boot.nix
    ./users.nix
    ./locale.nix
    ./desktop.nix
    ./audio.nix
    ./networking.nix
    ./layout.nix
    #./packages.nix
  ];


  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  git
  google-chrome
  firefox
  vscode
  alejandra
  
];  

}