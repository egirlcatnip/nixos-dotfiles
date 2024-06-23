{pkgs, ...}: {
  # Packages shared by all systems
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell.extensionUuid
    dash-to-panel.extensionUuid
    light-style.extensionUuid
    noannoyance-fork.extensionUuid
    tiling-assistant.extensionUuid
    light-shell.extensionUuid
  ];
}
