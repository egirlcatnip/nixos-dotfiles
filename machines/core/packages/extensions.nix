{pkgs, ...}: {
  # Packages shared by all systems
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-panel
    light-style
    noannoyance-fork
    tiling-assistant
    light-shell
  ];
}
