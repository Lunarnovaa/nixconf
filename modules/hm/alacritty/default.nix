{
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    alacritty.enable =
      lib.mkEnableOption "enables alacritty";
  };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font.size = lib.mkForce 10;
        window.dimensions = {
          lines = 28;
          columns = 101;
        };
      };
    };
  };
}
