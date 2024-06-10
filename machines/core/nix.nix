{ pkgs, ... }:
{

  nix = {
    settings = {
      trusted-users = [ "root" "egirlcatnip" "@wheel" "@sudo" ];
    };
    
    extraOptions = ''
      experimental-features = nix-command flakes
    '';


  };
  nixpkgs = {
      config.allowUnfree = true;
      config.permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  

}