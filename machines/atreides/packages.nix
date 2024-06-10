{ pkgs, ... }:


# Packages only for machine "atreides"
{
  environment.systemPackages = with pkgs; [
  eza
  bat  
];  
}