{pkgs, ...}:
# Packages only for machine "atreides"
{
  environment.systemPackages = with pkgs; [
    armcord
    firefox
    unstable.youtube-music
    armcord
  ];
}
