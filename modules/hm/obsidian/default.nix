{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.obsidian.enable {
    home.packages = [pkgs.obsidian];
  };
}
