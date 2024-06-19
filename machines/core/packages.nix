{pkgs, ...}:
# Packages for all systems to share
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alejandra
    bat
    eza
    ffmpeg_7-full

    git

    nh
    nixd
    ptyxis
    vscode
    armcord
    fastfetch
    starship

    zsh
    zoxide
    fzf
  ];
}
