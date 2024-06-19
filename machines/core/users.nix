{
  pkgs,
  username,
  ...
}: {
  users = {
    users.${username} = {
      description = "${username}";
      extraGroups = ["wheel"];
      isNormalUser = true;
      shell = pkgs.zsh;
    };
  };

  # Enable zsh shell
  programs = {
    zsh = {
      enable = true;

      shellInit = " eval \"$(starship init zsh)\" ";

      setOptions = [
        "HIST_FCNTL_LOCK"
        "APPEND_HISTORY"
        "SHARE_HISTORY"
        "INC_APPEND_HISTORY"
        "HIST_IGNORE_ALL_DUPS"
        "HIST_IGNORE_SPACE"
        "AUTO_CD"
      ];

      histFile = "$HOME/.zsh_history";
      histSize = "10000";
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
          "fzf-tab"
          "history"
          "rust"
        ];
      };
    };
  };

  # Enable git
  programs.git.enable = true;
}
