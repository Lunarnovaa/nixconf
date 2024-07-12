{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    zed.enable =
      lib.mkEnableOption "enables zed";
  };

  config = lib.mkIf config.zed.enable {
    home.packages = with pkgs; [
      zed-editor
    ];
  };
}
