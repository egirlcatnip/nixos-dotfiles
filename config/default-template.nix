{
  username,
  dotfiles,
  pkgs,
  ...
}: let
  config_path = ".config/path";
  config = "${dotfiles}/${config_path}";
in {
  home-manager.users.${username} = {
    home.file."${config_path}".source = "${config}";
  };
  environment.systemPackages = with pkgs; [];
}
