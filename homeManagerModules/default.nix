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

  ###################
  ## Loose Options ##
  ###################

  fastfetch.enable =
    lib.mkDefault false;
  spicetify.enable =
    lib.mkDefault true;
  firefox-vertical-tabs.enable =
    lib.mkDefault false;
  obs.enable =
    lib.mkDefault false;

  ######################
  ## Terminal Options ##
  ######################

  alacritty.enable =
    lib.mkDefault true;
  spaceship.enable =
    lib.mkDefault true;
  zsh.enable =
    lib.mkDefault true;

  #########################
  ## Development Options ##
  #########################

  # Declared in vscode.nix
  gui-dev.enable =
    lib.mkDefault true;

  # Declared in helix.nix
  terminal-dev.enable =
    lib.mkDefault false;
}
