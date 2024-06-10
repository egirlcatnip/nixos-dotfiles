{ pkgs, ... }:


# Packages only for machine "atreides"
{
  environment.systemPackages = with pkgs; [
  ptyxis
  blackbox
  eza
  bat  
];  
}