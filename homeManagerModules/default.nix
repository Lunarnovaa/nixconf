{ pkgs, lib, ... }: {
  imports = [
    #./bundles/desktop.nix
    ./configs/git.nix
    ./configs/firefox.nix
    ./configs/vscode.nix
    ./bundles/hyprland.nix
  ];

  git.enable =
    lib.mkDefault true;
  firefox.enable =
    lib.mkDefault true;
  vscode.enable =
    lib.mkDefault true;
  hyprland.enable =
    lib.mkDefault true;
}