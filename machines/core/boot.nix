{ lib, config, ... }:


{ 

  options = {
    grub.enable = lib.mkEnableOption "enable the grub bootloader";
    systemdboot.enable = lib.mkEnableOption "enable the systemdboot bootloader";

  };

  config = lib.mkMerge [
    
    (lib.mkIf config.grub.enable {

      config.systemdboot.enable = false;

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
      config.grub.enable = false;


      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
    })
  ];
}
