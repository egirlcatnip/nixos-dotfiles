{pkgs, ...}:
# Packages only for machine "atreides"
{
  environment.systemPackages = with pkgs; [
    armcord
    google-chrome
    firefox
    gnome.gnome-boxes
    unstable.youtube-music
    armcord
  ];
}
