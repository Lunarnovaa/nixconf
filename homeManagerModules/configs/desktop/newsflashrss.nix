{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.desktop.enable {
    home.packages = with pkgs; [
      fluent-reader
      newsflash
    ];
  };
}
