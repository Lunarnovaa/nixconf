{
  pkgs,
  lib,
  ...
}: {
  imports = [
    # Bundles
    ./bundles/general-apps.nix

    # Grouped Configurations
    ./configs/terminal/default.nix
    ./configs/dev/default.nix

    # Specific Configs w/Multiple Files
    ./configs/spotify/spotify-player.nix
    ./configs/firefox/firefox.nix

    # Loose Configs
    ./configs/fastfetch.nix
    ./configs/obs.nix
  ];

  ### Exposed Home Manager Options

  fastfetch.enable =
    lib.mkDefault true;
  spicetify.enable =
    lib.mkDefault true;
  firefox-vertical-tabs.enable =
    lib.mkDefault false;
  obs.enable =
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
