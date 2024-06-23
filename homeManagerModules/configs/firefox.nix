{inputs, lib, config, ... }: {
  
  options = { #own module for future extensibility
    firefox.enable =
      lib.mkEnableOption "enables firefox";
    };
  
  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
    };
  };
}