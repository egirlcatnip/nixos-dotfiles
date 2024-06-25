{
  username,
  dotfiles,
  pkgs,
  ...
}: let
  /*
  config_path = ".config/";
  config = "${dotfiles}/${config_path}";
  */
in {
  environment.systemPackages = with pkgs; [google-chrome];

  home-manager.users.${username} = {
    #home.file."${config_path}".source = "${config}";

    #TODO configuration
  };
}
