{username, ...}: {
  users.users.${username}.extraGroups = ["libvirtd"];

  virtualisation = {
    libvirtd.enable = true;
    podman.enable = true;
  };
}
