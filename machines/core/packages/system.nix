{pkgs, ...}: {
  # Packages that should not be removed, shared by all systems
  environment.systemPackages = with pkgs; [
    alejandra
    bat
    btop
    cod
    erdtree
    eza
    fd
    ffmpeg_7-full
    file
    fzf
    gh
    git
    gparted
    helix
    hyperfine
    nh
    nil
    nixd
    onefetch
    ouch
    procs
    ptyxis
    ripgrep
    starship
    tealdeer
    trashy
    vim
    wl-clipboard
    zoxide
    zsh
    pods
    vscode
    nix-alien
  ];

  # Exclude the default x.org terminal
  services.xserver.excludePackages = [pkgs.xterm];
}
