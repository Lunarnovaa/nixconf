{
  pkgs,
  lib,
  ...
}: {
  imports = [
    # Bundles
    ./bundles/general-apps.nix

    # Development Configs
    ./configs/dev/git.nix
    ## GUI Development Configs
    ./configs/dev/gui/vscode.nix
    ## Terminal Development Configs
    ./configs/dev/terminal/helix.nix

    # Terminal Configuration
    ./configs/terminal/alacritty.nix
    ./configs/terminal/nushell.nix
    ./configs/terminal/spaceship.nix

    # Specific Configs w/Multiple Files
    ./configs/spotify/spotify-player.nix
    ./configs/firefox/firefox.nix

    # Loose Configs
    ./configs/fastfetch.nix
    ./configs/obs.nix
    ./configs/xremap.nix
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
  xremap.enable =
    lib.mkDefault true;

  ######################
  ## Terminal Options ##
  ######################

  alacritty.enable =
    lib.mkDefault true;
  nushell.enable =
    lib.mkDefault true;
  spaceship.enable =
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
