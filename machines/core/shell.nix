{pkgs, ...}: {
  # Enable zsh shell
  programs = {
    zsh = {
      enable = true;

      promptInit = " eval \"$(starship init zsh)\" ";

      interactiveShellInit = ''
        source "${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh"
        autoload -Uz compinit && compinit
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      '';

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
      histSize = 10000;

      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}
