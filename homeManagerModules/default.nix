{
  pkgs,
  lib,
  ...
}: {
  imports = [
    #./bundles/desktop.nix
    ./configs/git.nix
    ./configs/firefox.nix
    ./configs/vscode.nix
    ./configs/zsh.nix
    ./configs/wezterm.nix
    ./configs/fastfetch.nix
  ];

  git.enable =
    lib.mkDefault true;
  firefox.enable =
    lib.mkDefault true;
  vscode.enable =
    lib.mkDefault true;
  zsh.enable =
    lib.mkDefault true;
  wezterm.enable =
    lib.mkDefault true;
  fastfetch.enable =
    lib.mkDefault false;
}
