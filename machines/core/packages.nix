{ pkgs, ... }:


# this doesn't work
{
  environment.systemPackages = with pkgs; [
  git
  google-chrome
  firefox
  vscode
  alejandra
  
];  
}