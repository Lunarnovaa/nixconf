{...}: {
  imports = [
    ./spotify/default.nix
    
    ./git.nix
    ./nushell.nix
    ./obsidian.nix
    ./prism-launcher.nix
    ./starship.nix
    ./vesktop.nix
    ./vscode.nix
  ];
}