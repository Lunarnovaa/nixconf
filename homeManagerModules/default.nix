{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./bundles/desktop.nix
    ./configs/vscode.nix
    ./configs/obs.nix
  ];

  vscode.enable =
    lib.mkDefault true;
  obs.enable =
    lib.mkDefault false;
}
