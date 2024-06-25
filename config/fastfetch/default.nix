{
  username,
  dotfiles,
  pkgs,
  ...
}: let
  config_path = ".config/fastfetch/config.jsonc";
  config = "${dotfiles}/${config_path}";
in {
  environment.systemPackages = with pkgs; [fastfetch];

  home-manager.users.${username} = {
    home.file."${config_path}".source = "${config}";
  };
}
