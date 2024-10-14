{config, ...}: {
  imports = [
    ./firefox/default.nix
    ./spotify/default.nix

    ./alacritty.nix
    ./fastfetch.nix
    ./git.nix
    ./nushell.nix
    ./obs.nix
    ./obsidian.nix
    ./spaceship.nix
    ./vesktop.nix
    ./vscode.nix
  ];
}
