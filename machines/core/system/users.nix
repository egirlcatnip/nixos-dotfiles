{
  pkgs,
  username,
  ...
}: {
  users = {
    defaultUserShell = pkgs.zsh;

    users.${username} = {
      description = "${username}";
      extraGroups = ["wheel"];
      isNormalUser = true;
    };
  };
}
