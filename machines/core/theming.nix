{
  lib,
  config,
  ...
}: {
  options = {
    theming.enable = lib.mkEnableOption "global theming toggle";
  };

  config = lib.mkIf config.theming.enable {
    catppuccin.enable = true;
    boot.loader.grub.catppuccin.enable = false;
    catppuccin.accent = "lavender";
    catppuccin.flavor = "mocha";

    boot.loader.grub.theme = ./../../dotfiles/grub-catppuccin/src/catppuccin-mocha-grub-theme/theme.txt;
  };
}
