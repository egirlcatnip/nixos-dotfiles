{ lib, config, ... }:

{ 
  options = {
    gnome.enable = lib.mkEnableOption "enable Gnome desktop enviroment";
    kde.enable = lib.mkEnableOption "enable KDE desktop enviroment";
  };

  config = lib.mkMerge [
    
    (lib.mkIf config.gnome.enable {
      assertions =
      [ { 
          assertion = !config.kde.enable;
          message = "gnome conflicts with kde";
        }
      ];
      services.xserver.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
      services.xserver.displayManager.gdm.enable = true;
    })

    (lib.mkIf config.kde.enable {
      assertions =
      [ { 
          assertion = !config.gnome.enable;
          message = "kde conflicts with gnome";
        }
      ];
      
      services.xserver.enable = true;
      services.desktopManager.plasma6.enable = true;
      services.displayManager.sddm.enable = true;
    })
  ];
}
