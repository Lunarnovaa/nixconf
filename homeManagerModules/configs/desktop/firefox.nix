{
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    #own module for future extensibility
    desktop.enable =
      lib.mkEnableOption "enables desktop";
  };

  config = lib.mkIf config.desktop.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
