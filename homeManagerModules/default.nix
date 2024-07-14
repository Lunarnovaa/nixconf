{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./bundles/desktop.nix
    ./configs/vscode.nix
    ./configs/obs.nix
    ./configs/zed.nix
    ./configs/fastfetch.nix
  ];

  vscode.enable =
    lib.mkDefault true;
  obs.enable =
    lib.mkDefault false;
  zed.enable =
    lib.mkDefault true;
  fastfetch.enable =
    lib.mkDefault true;
}
