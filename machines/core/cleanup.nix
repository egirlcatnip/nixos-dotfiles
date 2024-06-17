{...}: {
  nix.optimise.automatic = true;

  nix.gc = {
    automatic = false;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
