{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.development.enable {
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
