{ lib, config, ... }:

let  symbols = ./../dotfiles/.config/xkb/symbols/egirlcattype;

in { 

  options = {
    layout.enable = lib.mkEnableOption "personal keyboard layout";
  };


  config = lib.mkIf config.layout.enable {
    
    # Create layout
    services.xserver.xkb.extraLayouts = {
      egirlcattype = {
        description = "Slovak (egirlcattype)";
        languages = [ "sk" ];
        symbolsFile = "${symbols}";
      };
    };

    # Apply layout
    services.xserver.xkb.layout = "egirlcattype"; 

    # Share layout
    console.useXkbConfig = true;

  };

}