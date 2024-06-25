{...}: {
  services.flatpak = {
    enable = true;

    # Add flathub and flathub beta remotes
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
      {
        name = "flathub-beta";
        location = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];
    # Flatpak packages shared by all systems
    packages = [
      # "com.modrinth.ModrinthApp"
    ];
  };
}
