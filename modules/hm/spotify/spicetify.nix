{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
in {
  config = mkIf config.spicetify.enable {
    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        powerBar
        fullAlbumDate
        fullAppDisplay
        listPlaylistsWithSong
        playNext
        volumePercentage
      ];
      enabledCustomApps = with spicePkgs.apps; [
        lyricsPlus
        newReleases
      ];
    };
  };
}
