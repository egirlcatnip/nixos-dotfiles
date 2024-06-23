{
  pkgs,
  dotfiles,
  ...
}: {
  # Enable zsh shell
  programs = {
    zsh = {
      enable = true;

      histFile = "$HOME/.history";
      histSize = 20000;

      # Starship prompt
      promptInit = ''eval "$(starship init zsh)" '';

      shellInit = ''
        export STARSHIP_CONFIG="/etc/starship"
        export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
        compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
      '';

      # .zshrc
      interactiveShellInit = ''
        source "${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh"
        source "${pkgs.zsh-fzf-history-search}/share/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh"
        eval "$(zoxide init zsh)"

        # autocomplete
        autoload -Uz compinit && compinit

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
    };
  };
  environment.etc = {
    starship.source = "${dotfiles}/.config/starship/starship.toml";
  };

  environment.variables = {
    EDITOR = "code";
    BROWSER = "google-chrome-stable";
    TERM = "ptyxis";
  };
}
