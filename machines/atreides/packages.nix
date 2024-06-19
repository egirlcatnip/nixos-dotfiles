{pkgs, ...}:
# Packages only for machine "atreides"
{
  environment.systemPackages = with pkgs; [
    blackbox-terminal
    gnome.dconf-editor
  ];
}
