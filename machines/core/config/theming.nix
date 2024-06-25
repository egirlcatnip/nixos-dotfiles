{
  lib,
  config,
  dotfiles,
  ...
}: let
  grub_theme = "${dotfiles}/modified/catppuccin-mocha-grub-theme";
in {
  options = {
    theming.enable = lib.mkEnableOption "global theming toggle";
  };

  config = lib.mkIf config.theming.enable {
    catppuccin.accent = "lavender";
    catppuccin.flavor = "mocha";

    catppuccin.enable = true;
    boot.plymouth.catppuccin.enable = false;
    boot.loader.grub.catppuccin.enable = false;

    # Local catppuccin grub theme edited to fix the nixos-generations entries' text
    # https://github.com/catppuccin/grub/issues/21
    boot.loader.grub.theme = grub_theme;
  };
}
