{pkgs, ...}:
# Packages only for machine "atreides"
{
  environment.systemPackages = with pkgs; [
    armcord
    gnome.dconf-editor
    google-chrome
    firefox
    gnome.gnome-boxes
  ];
}
