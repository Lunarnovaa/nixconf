{
  pkgs,
  lib,
  ...
}: {
  imports = [
    # Bundles
    ./bundles/general-apps.nix

    # Grouped Configurations
    ./configs/firefox/firefox.nix
    ./configs/terminal/default.nix
    ./configs/dev/default.nix

    ./configs/fastfetch.nix
    ./configs/obs.nix
    ./configs/spotify.nix
  ];

  ### Exposed Home Manager Options

  fastfetch.enable =
    lib.mkDefault true;
  spotify.enable =
    lib.mkDefault true;
  firefox-vertical-tabs.enable =
    lib.mkDefault false;

  ## Terminal
  spaceship.enable =
    lib.mkDefault true;
  wezterm.enable =
    lib.mkDefault true;
  zsh.enable =
    lib.mkDefault true;

  ## Development

  # Declared in vscode.nix
  gui-dev.enable =
    lib.mkDefault true;

  # Declared in helix.nix
  terminal-dev.enable =
    lib.mkDefault false;
}
