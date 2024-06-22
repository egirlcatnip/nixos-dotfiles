{pkgs, ...}: {
  # Packages that should not be removed, shared by all systems
  environment.systemPackages = with pkgs; [
    alejandra
    bat
    btop
    erdtree
    eza
    fastfetch
    ffmpeg_7-full
    fzf
    gh
    git
    helix
    nh
    nixd
    ptyxis
    ripgrep
    starship
    vim
    zoxide
    zsh
  ];
}
