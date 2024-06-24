{
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    #own module for future extensibility
    wezterm.enable =
      lib.mkEnableOption "enables wezterm";
  };

  config = lib.mkIf config.wezterm.enable {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = ''        return {
               font_size = 10.0, 


             } '';
    };
  };
}
