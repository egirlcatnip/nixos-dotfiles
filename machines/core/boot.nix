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
        #device = "/dev/nvme";
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
        consoleLogLevel = 3;

        initrd = {
          verbose = false;
          systemd.enable = true;
        };

        initrd.kernelModules = [
          "i915"
        ];

        plymouth.enable = true;

        kernelParams = [
          "i915.fastboot=1"
          # prevent the kernel from blanking plymouth out of the fb
          "fbcon=nodefer"
          # disable boot logo if any
          "logo.nologo"
          # tell the kernel to not be verbose
          "quiet"
          "splash"
          # disable systemd status messages
          "rd.systemd.show_status=auto"
          # lower the udev log level to show only errors or worse
          "rd.udev.log_level=3"
          # disable the cursor in vt to get a black screen during intermissions
          # TODO turn back on in tty
          "vt.global_cursor_default=0"
        ];
      };
    })
  ];
}
