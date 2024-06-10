{...}: {
  # Enable flatpak support
  services.flatpak.enable = true;

  # Add flathub as a remote
  services.flatpak.remotes = {
    "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepoa";
    "flathub-beta" = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
  };
}