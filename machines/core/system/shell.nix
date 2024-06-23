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
      promptInit = ''
        export STARSHIP_CONFIG="/etc/starship"
        eval "$(starship init zsh)"
      '';

      # .zshrc
      interactiveShellInit = ''

        source "${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh"
        source "${pkgs.zsh-fzf-history-search}/share/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh"
        eval "$(zoxide init zsh)"

        autoload -Uz compinit && compinit
        zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=* m:{a-z}={A-Za-z}'

        bindkey "^[[1;5C" emacs-forward-word
        bindkey "^[[1;5D" emacs-backward-word
        bindkey "^[[3~" delete-char
        bindkey "^[[3;5~" kill-word
        bindkey '^H' backward-kill-word


      '';

      loginShellInit = ''
        compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
        if ! [ -d "~/.zshrc" ]; then
          touch ~/.zshrc
        fi
      '';

      setOptions = [
        "HIST_EXPIRE_DUPS_FIRST"
        "HIST_IGNORE_SPACE"
        "HIST_FIND_NO_DUPS"
        "HIST_SAVE_NO_DUPS"
        "HIST_IGNORE_DUPS"
        "HIST_IGNORE_ALL_DUPS"
        "HIST_FCNTL_LOCK"
        "APPEND_HISTORY"
        "SHARE_HISTORY"
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
    TERM = "xdg-terminal-exec";
  };
  xdg.terminal-exec = {
    enable = true;
    settings = {
      GNOME = [
        "org.gnome.Ptyxis.desktop"
      ];
      KDE = [
        "org.kde.konsole.desktop"
      ];
    };
  };
}
