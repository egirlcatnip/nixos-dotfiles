{pkgs, ...}: {
  # Enable zsh shell
  programs = {
    zsh = {
      enable = true;

      # Enable starship prompt
      promptInit = ''eval "$(starship init zsh)" '';

      interactiveShellInit = ''
        ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
        HISTFILE = "$XDG_CONFIG_HOME/zsh/history";
        HISTSIZE = 20000;



        export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
        export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

        source "${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh"
        source "${pkgs.zsh-fzf-history-search}/share/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh"

        # autocomplete
        autoload -Uz compinit && compinit
        compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

        # Ignore caps on autocomplete
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

      syntaxHighlighting.enable = true;
    };
  };
}
