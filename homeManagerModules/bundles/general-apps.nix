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

    #rnnoise-plugin

    #vial #if having issues with detectino, try sudo chmod 777 /dev/hidraw3 (https://github.com/the-via/releases/issues/257#issuecomment-1595811563)
  ];
}
