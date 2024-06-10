{ pkgs, pkgs-unstable, ... }:

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
  ];



  
# CORE PACKAGES
environment.systemPackages = 

#STABLE
(with pkgs; 
[
git
gh
vscode
google-chrome
firefox
ptyxis

])
++
(with pkgs-unstable; 
[
blackbox

]);

  
}