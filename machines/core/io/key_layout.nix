{
  lib,
  config,
  dotfiles,
  ...
}: {
  options = {
    layout.enable = lib.mkEnableOption "personal keyboard layout";
  };

  config = lib.mkIf config.layout.enable {
    # Create layout from symbols file
    services.xserver.xkb.extraLayouts = {
      egirlcattype = {
        description = "Slovak (egirlcattype)";
        languages = ["sk"];
        symbolsFile = "${dotfiles}/.config/xkb/symbols/egirlcattype";
      };
    };

    # Apply layout
    services.xserver.xkb.layout = "egirlcattype";

    # Share the used layout in tty
    console.useXkbConfig = true;
  };
}
