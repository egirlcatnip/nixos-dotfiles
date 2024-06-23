{pkgs, ...}: {
  # Fonts for gnome are configured in the file |home/gnome.nix

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
      corefonts
    ];
  };
}
