{
  username,
  dotfiles,
  pkgs,
  ...
}: let
  config_path = ".config/YouTube Music/config.json";
  config = "${dotfiles}/${config_path}";
in {
  environment.systemPackages = with pkgs; [unstable.youtube-music];
  home-manager.users.${username} = {
    home.file."${config_path}".source = "${config}";
  };
}
