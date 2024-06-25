{pkgs, ...}: {
  # Packages shared by all systems
  environment.systemPackages = with pkgs; [
    # Main browser
    google-chrome
    #chromium
    #firefox

    #Text editor/IDE
    vscode
  ];

  # Exclusions
  services.xserver.excludePackages = [pkgs.xterm];
}
