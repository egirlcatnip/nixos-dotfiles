{ lib, types, ...}: 

{
  options = {
    username = lib.mkOption  {
      type = types.str;
      # default = "egirlcatnip";
      example = "paul_atreides";
      description = "username of the main system account";

    };

  };
  

  
}
