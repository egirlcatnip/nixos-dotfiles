{
  username,
  dotfiles,
  pkgs,
  ...
}: let
  config_path = ".config/Armcord/storage/settings.json";
  config = "${dotfiles}/${config_path}";
in {
  environment.systemPackages = with pkgs; [armcord];

  home-manager.users.${username} = {
    home.file."${config_path}".source = "${config}";
  };
}
