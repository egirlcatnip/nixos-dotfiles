{pkgs, ...}: {
  # Enable flatpak support
  services.flatpak.enable = true;
  services.flatpak.update.onActivation = false;

  systemd.services."flatpak-managed-install" = {
    serviceConfig = {
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 5";
    };
  };

  # Add flathub and flathub beta as a remote
  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }
    {
      name = "flathub-beta";
      location = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }
  ];
}
