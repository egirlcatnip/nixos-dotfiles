{ lib, config, ... }:

{ 
  options = {
    gnome.enable = lib.mkEnableOption "enable Gnome desktop enviroment";
    kde.enable = lib.mkEnableOption "enable KDE desktop enviroment";

  };

  config = lib.mkMerge [
    
    (lib.mkIf config.gnome.enable {
      config.kde.enable = false;

      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
    })


    (lib.mkIf config.kde.enable {
      config.gnome.enable = false;
    
      services.displayManager.sddm.enable = false;
      services.desktopManager.plasma6.enable = false;

    })
  ];
}
