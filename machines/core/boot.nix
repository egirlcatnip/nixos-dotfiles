{ lib, config, ... }:

{ 
  options = {
    grub.enable = lib.mkEnableOption "enable the grub bootloader";
    systemdboot.enable = lib.mkEnableOption "enable the systemdboot bootloader";
    plymouth.enable = lib.mkEnableOption "enable plymouth boot animation";
    silent_boot.enable = lib.mkEnableOption "enable plymouth boot animation";


  };

  config = lib.mkMerge [
    
    (lib.mkIf config.grub.enable {
      assertions =
      [ { 
          assertion = !config.systemdboot.enable;
          message = "grub conflicts with systemdboot";
        }
      ];

      boot.loader.grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };

      boot.loader.efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    })

    (lib.mkIf config.systemdboot.enable {
      assertions =
      [ { 
          assertion = !config.grub.enable;
          message = "systemdboot conflicts with grub";
        }
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
    })

    (lib.mkIf config.plymouth.enable {
      boot.plymouth = {
        enable = true; 
      };
    })

    (lib.mkIf config.silent_boot.enable {
      consoleLogLevel = 0;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
       "boot.shell_on_fail"
       "loglevel=3"
       "rd.systemd.show_status=false"
       "rd.udev.log_level=3"
       "udev.log_priority=3"
    ];

    })

  ];
}
