{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    spicetify.enable =
      lib.mkEnableOption "enables spicetify";
  };

  config = lib.mkIf config.spicetify.enable {
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