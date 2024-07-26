{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.development.enable {
    home.packages = with pkgs; [
      zed-editor
    ];
  };
}
