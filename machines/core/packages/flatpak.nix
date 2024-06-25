{
  config,
  lib,
  pkgs,
  ...
}: {
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

  # Workaround for allowing flatpak access to cursor and icon theme
  system.fsPackages = [pkgs.bindfs];
  fileSystems =
    lib.mapAttrs
    (_: v:
      v
      // {
        fsType = "fuse.bindfs";
        options = ["ro" "resolve-symlinks" "x-gvfs-hide"];
      })
    {
      "/usr/share/icons".device = "/run/current-system/sw/share/icons";
      "/usr/share/fonts".device =
        pkgs.buildEnv
        {
          name = "system-fonts";
          paths = config.fonts.fonts;
          pathsToLink = ["/share/fonts"];
        }
        + "/share/fonts";
    };
}
