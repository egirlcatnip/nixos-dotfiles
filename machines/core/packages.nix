{pkgs, ...}:
# Packages for all systems to share
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    alejandra
    nixd
    nh
    ffmpeg_7-full
  ];
}
