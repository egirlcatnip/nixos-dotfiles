{pkgs, ...}: {
  # Fonts for gnome are configured in the file /configuration/home/gnome.nix

  fonts = {
    enableDefaultPackages = true;
    fontDir = true;

    fontconfig = {
      antialias = true;
      cache32Bit = true;
      hinting.autohint = true;
      hinting.enable = true;
    };

    packages = with pkgs; [(nerdfonts.override {fonts = ["Monaspace" "JetBrainsMono"];})];
  };
}
