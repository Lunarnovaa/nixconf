{
  pkgs,
  lib,
  ...
}: {
  imports = [
    # Bundles
    ./bundles/general-apps.nix

    # Specific Configurations
    ./configs/development/default.nix
    #./configs/firefox/firefox.nix
    ./configs/terminal/default.nix

    ./configs/fastfetch.nix
    ./configs/obs.nix
    ./configs/spotify.nix
  ];

  fastfetch.enable =
    lib.mkDefault true;
  spotify.enable =
    lib.mkDefault true;
}
