{
  pkgs,
  dotfiles,
  ...
}: let
  zsh-shift-select = pkgs.pkgs.fetchFromGitHub {
    owner = "jirutka";
    repo = "zsh-shift-select";
    rev = "da460999b7d31aef0f0a82a3e749d70edf6f2ef9";
    hash = "sha256-ekA8acUgNT/t2SjSBGJs2Oko5EB7MvVUccC6uuTI/vc=";
  };
in {
  # Enable zsh shell
  programs = {
    zsh = {
      enable = true;

      histFile = "$HOME/.history";
      histSize = 20000;

      interactiveShellInit = ''
        export STARSHIP_CONFIG="/etc/starship"
        eval "$(starship init zsh)"
        source "${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh"
        source "${pkgs.zsh-fzf-history-search}/share/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh"
        source "${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use/you-should-use.plugin.zsh"

        source "${zsh-shift-select}/zsh-shift-select.plugin.zsh"

        eval "$(zoxide init zsh)"

        zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=* m:{a-z}={A-Za-z}'

        bindkey "^[[1;5C" emacs-forward-word
        bindkey "^[[1;5D" emacs-backward-word
        bindkey "^[[3~" delete-char
        bindkey "^[[3;5~" kill-word
        bindkey '^H' backward-kill-word
      '';

      loginShellInit = ''
        if ! [ -d "~/.config/zsh/.zshrc" ]; then
          touch ~/.config/zsh/.zshrc
        fi
      '';

      setOptions = [
        "HIST_EXPIRE_DUPS_FIRST"
        "HIST_IGNORE_DUPS"
        "HIST_IGNORE_ALL_DUPS"
        "HIST_IGNORE_SPACE"
        "HIST_FIND_NO_DUPS"
        "HIST_SAVE_NO_DUPS"
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
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "org.gnome.Ptyxis.desktop"
      ];
      GNOME = [
        "org.gnome.Ptyxis.desktop"
      ];
      KDE = [
        "org.kde.konsole.desktop"
      ];
    };
  };
}
