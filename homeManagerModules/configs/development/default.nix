{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./git.nix
    ./vscode.nix
    #./zed.nix
    ./helix.nix
  ];

  development.enable =
    #note: var established in git.nix
    lib.mkDefault true;
}
