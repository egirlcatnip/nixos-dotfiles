{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      corefonts # Microsoft web safe fonts (yes, Comic Sans too...)
    ];
  };
}
