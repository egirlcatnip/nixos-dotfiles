{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;

    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
    ];
  };
}
