{lib, ...}: {
  imports = [
    ./alacritty/default.nix

    ./fastfetch/default.nix

    ./firefox/default.nix

    ./git/default.nix

    ./nushell/default.nix

    ./obs/default.nix

    ./obsidian/default.nix

    ./spaceship/default.nix

    ./spotify/default.nix

    ./vscode/default.nix
  ];
  alacritty.enable =
    lib.mkDefault true;

  fastfetch.enable =
    lib.mkDefault false;

  firefox-vertical-tabs.enable =
    lib.mkDefault false;

  nushell.enable =
    lib.mkDefault true;

  obs.enable =
    lib.mkDefault false;

  obsidian.enable =
    lib.mkDefault true;

  spaceship.enable =
    lib.mkDefault true;

  spicetify.enable =
    lib.mkDefault true;

  vscode.enable =
    lib.mkDefault true;
}
