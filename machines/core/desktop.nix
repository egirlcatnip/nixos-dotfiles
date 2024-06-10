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


      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;
    })

    (lib.mkIf config.kde.enable {
      assertions =
      [ { 
          assertion = !config.gnome.enable;
          message = "kde conflicts with gnome";
        }
      ];



    
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;

    })
  ];
}
