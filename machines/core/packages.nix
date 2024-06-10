{pkgs, ...}:
# Packages for all systems to share
{
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

  # Enable flatpak support
  config.services.flatpak.enable = true;
  services.flatpak.remotes = {
    "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    "flathub-beta" = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
  };
}
