{inputs, lib, config, ... }: {
  
  options = {
    micro.enable =
      lib.mkEnableOption "enables micro";
    };
  
  config = lib.mkIf config.micro.enable {
    programs.micro = {
      enable = true;
      settings = {

      };
    };

  };
}