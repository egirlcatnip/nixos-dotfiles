{
  username,
  pkgs,
  ...
}: {
  imports = [
    ./extensions.nix
    ./keybindings.nix
    ./fonts.nix
    ./gtk.nix
    ./nautilus.nix
  ];

  home-manager.users.${username} = {
    dconf.enable = true;

    dconf.settings = {
      "org/gnome/desktop/wm/preferences" = {
        # Set windows buttons to MS Windows Style
        button-layout = ":minimize,maximize,close";
        resize-with-right-button = true;
      };
    };
  };

  # Gnome related packages
  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    gnome-extension-manager
    gnome.dconf-editor
    pods
  ];

  # Excluded packages from Gnome DE install
  environment.gnome.excludePackages = with pkgs; [
    epiphany # Gnome Web
    gnome-connections # Gnome remote desktop app
    gnome-console # Gnome default terminal
    gnome-tour # Gnome welcome aapp
    gnome.geary # Gnome email app
    gnome.gnome-clocks
    gnome.gnome-contacts
    gnome.gnome-maps
    gnome.gnome-music #
    gnome.gnome-shell-extensions # Default gnome extensions
    gnome.gnome-weather
    gnome.seahorse # Gnome passwords app
    gnome.simple-scan # Gnome document scanner app
    gnome.totem # Gnome video player
    gnome.yelp # Gnome help app
  ];
}
