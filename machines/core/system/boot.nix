{
  lib,
  config,
  ...
}: {
  options = {
    grub.enable = lib.mkEnableOption "enable the grub bootloader";
    systemdboot.enable = lib.mkEnableOption "enable the systemdboot bootloader";
    silentboot.enable = lib.mkEnableOption "enable silent boot";
  };

  config = lib.mkMerge [
    (lib.mkIf config.grub.enable {
      assertions = [
        {
          assertion = !config.systemdboot.enable;
          message = "grub conflicts with systemdboot";
        }
      ];

      boot.loader.grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        timeoutStyle = "hidden";
      };

      boot.loader.efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    })

    (lib.mkIf config.systemdboot.enable {
      assertions = [
        {
          assertion = !config.grub.enable;
          message = "systemdboot conflicts with grub";
        }
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
    })

    (lib.mkIf config.silentboot.enable {
      console.earlySetup = true;

      boot = {
        consoleLogLevel = 0;

        initrd = {
          verbose = false;
          systemd.enable = true;
        };

        plymouth.enable = true;

        kernelParams = [
          "quiet"
          "splash"
          "rd.systemd.show_status=false"
          "rd.udev.log_level=3"
          "udev.log_priority=3"
          "boot.shell_on_fail"
        ];
      };
    })
  ];
}
