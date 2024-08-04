{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    terminal-dev.enable =
      lib.mkEnableOption "enables terminal-dev";
  };

  config = lib.mkIf config.terminal-dev.enable {
    programs.helix = {
      enable = true;
      defaultEditor = true;

      settings = {
        keys.normal = {
          # Movement keys of hjkl -> hnei
          h = "move_char_left";
          n = "move_line_down";
          e = "move_line_up";
          i = "move_char_right";
        };
      };
    };
  };
}
