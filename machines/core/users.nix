{ username, pkgs, ... }:

{ 
  users = {
    users.${username} = {
      description = "${username}";
      extraGroups = [ "wheel" ];
      isNormalUser = true;
      shell = pkgs.zsh;
    };
  };


  # Enable zsh shell
  programs.zsh.enable = true;

}
