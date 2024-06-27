{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../configs/git.nix
    ../configs/terminal/default.nix
    ../configs/firefox.nix
  ];

  git.enable =
    lib.mkDefault true;
  firefox.enable =
    lib.mkDefault true;
  terminal.enable =
    lib.mkDefault true;
}
