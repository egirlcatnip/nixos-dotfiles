{username, ...}: {
  users.users.${username}.extraGroups = ["libvirtd"];

  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
  };
}
