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
  ];

  # Enable flatpak support
  services.flatpak.enable = true;
}
