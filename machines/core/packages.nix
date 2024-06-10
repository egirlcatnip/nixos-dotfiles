{pkgs, ...}:
# Packages for all systems to share
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    google-chrome
    firefox
    vscode
    alejandra
    nixd
    nh
    ffmpeg_7-full
  ];
}
