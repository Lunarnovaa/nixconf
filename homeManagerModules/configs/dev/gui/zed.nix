{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.gui-dev.enable {
    home.packages = with pkgs; [
      zed-editor
    ];
  };
}
