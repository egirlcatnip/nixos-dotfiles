{...}: {
  # Configured on shell startup
  environment.variables = {
    # XDG Base dir specification
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Default programs

    # XDG Ninja
    GNUPGHOME = "$XDG_DATA_HOME/gnupg";

    # FZF
    FZF_DEFAULT_OPTS = ''
      --scroll-off=10
      --min-height=10
      --layout=reverse

      --marker='('
      --pointer='>'
      --prompt=' '
      --info="right"
      --color=bg:-1,bg+:-1,fg:-1,fg+:3,hl:2,hl+:2,header:-1,info:1,pointer:1,marker:-1,prompt:-1,spinner:3,border:-1
    '';
  };
}
