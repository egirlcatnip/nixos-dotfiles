{pkgs, ...}: {
  # Enable running dynamically linked binaries
  programs.nix-ld.dev.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];
}
