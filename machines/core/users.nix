{
  pkgs,
  username,
  ...
}: {
  users = {
    users.${username} = {
      description = "${username}";
      extraGroups = ["wheel"];
      isNormalUser = true;
      shell = pkgs.zsh;
    };
  };
  programs.zsh.enable = true;
}
