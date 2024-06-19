{pkgs, ...}: {
  # Default terminal
  xdg.terminal-exec = {
    enable = true;
    package = pkgs.ptyxis;
  };
}
