{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ### General Development Apps
    ./git.nix # Always enabled

    ### GUI Development Apps
    ./gui/vscode.nix

    ### Terminal Development Apps
    ./terminal/helix.nix
  ];
}
