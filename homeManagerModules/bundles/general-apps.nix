{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    obsidian
    vlc

    # RSS Reader
    newsflash

    firefox
  ];
}
