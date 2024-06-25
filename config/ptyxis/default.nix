{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ptyxis
  ];

  home-manager.users.${username} = {
    dconf.settings = {
      "org/gnome/Ptyxis" = {
        cursor-shape = "ibeam";
        visual-bell = false;
        audible-bell = false;
      };
    };
  };
}
