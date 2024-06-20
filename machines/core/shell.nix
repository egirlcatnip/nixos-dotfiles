{pkgs, ...}: {
  # Enable zsh shell
  programs = {
    zsh = {
      enable = true;

      promptInit = " eval \"$(starship init zsh)\" ";

      interactiveShellInit = ''
        source "${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh"

        source "${pkgs.zsh-fzf-history-search}/share/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh"


        autoload -Uz compinit && compinit
        compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      '';

      setOptions = [
        "HIST_IGNORE_DUPS"
        "HIST_IGNORE_ALL_DUPS"

        "HIST_FCNTL_LOCK"
        "APPEND_HISTORY"
        "SHARE_HISTORY"
        "HIST_IGNORE_SPACE"
        "AUTO_CD"
      ];

      histFile = "$XDG_CONFIG_HOME/zsh/history";
      #histFile = "~/.zsh_history";
      histSize = 10000;

      #autosuggestions.enable = true;
      #syntaxHighlighting.enable = true;
    };
  };
}
