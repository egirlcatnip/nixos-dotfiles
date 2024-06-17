{
  pkgs,
  username,
  ...
}: {
  users = {
    users.${username} = {
      description = "${username} - main user";
      extraGroups = ["wheel"];
      isNormalUser = true;
      shell = pkgs.zsh;
    };
  };

  # Enable zsh shell
  programs.zsh.enable = true;
  # Enable git
  programs.git.enable = true;
}
