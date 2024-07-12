{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../configs/git.nix
    ../configs/terminal/default.nix
    ../configs/firefox.nix
    ../configs/spotify.nix
  ];

  git.enable =
    lib.mkDefault true;
  firefox.enable =
    lib.mkDefault true;
  terminal.enable =
    lib.mkDefault true;
  spotify.enable =
    lib.mkDefault true;
}
