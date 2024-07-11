{
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    spotify-player.enable =
      lib.mkEnableOption "enables spotify-player";
  };

  config = lib.mkIf config.git.enable {
    programs.spotify-player = {
      enable = true;
      
    };
  };
}
