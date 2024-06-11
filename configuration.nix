{lib, ...}: {
  options = {
    username = lib.mkOption {
      description = "Set the username of your main user";
      type = lib.types.str;
      default = "egirlcatnip";
      example = "paul_atreides";
    };
  };
}
