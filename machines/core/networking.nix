{...}: {
  networking.networkmanager.enable = true;

  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };
}
