{pkgs, ...}: {
  # Fonts for gnome are configured in the file /configuration/home/gnome.nix

  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [(nerdfonts.override {fonts = ["Monaspace" "JetBrainsMono"];})];
  };
}
