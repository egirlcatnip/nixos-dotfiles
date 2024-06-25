{
  username,
  pkgs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
  };

  home-manager.users.${username} = {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        font-name = "JetBrainsMono Nerd Font 11";
        document-font-name = "JetBrainsMono Nerd Font 11";
        monospace-font-name = "JetBrainsMono Nerd Font 11";
      };
    };
  };
}
