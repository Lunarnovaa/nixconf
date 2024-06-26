{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./bundles/desktop.nix
    ./configs/vscode.nix
      ];


  vscode.enable =
    lib.mkDefault true;
}
