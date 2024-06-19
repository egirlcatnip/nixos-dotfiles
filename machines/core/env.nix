{...}: {
  environment.variables = rec {
    # XDG Base dir specification
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # XDG Ninja

    # ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
    # HISTFILE = "$XDG_CONFIG_HOME/zsh/history";

    GTK2_RC_FILES = "$XDG_CONFIG_HOME/gtk-2.0/gtkrc";

    # Starship config
    STARSHIP_CONFIG = "$XDG_CONFIG_HOME/starship/starship.toml";

    # FZF
    FZF_DEFAULT_OPTS = ''
      --scroll-off=10
      --border="rounded"
      --marker=\" (\"
      --pointer=\" \"
      --info="right"
      --color=bg+:-1,bg:-1,fg:0,fg+:3,hl:2,hl+:2,header:0,info:1,pointer:1,marker:4,prompt:0,spinner:3,border:0
    '';
  };
}
