{lib, ...}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) bool;
in {
  options.loose = {
    bottom = mkOption {
      type = bool;
      default = false;
      description = ''
        Enables bottom, a graphical process/system monitor tool.
      '';
    };
    fastfetch = mkOption {
      type = bool;
      default = false;
      description = ''
        Enables fastfetch, a highly-configurable fetching tool.
      '';
    };
    spicetify = mkOption {
      type = bool;
      default = false;
      description = ''
        Enables the official Spotify client with theming from
        Spicetify.
      '';
    };
    via = mkOption {
      type = bool;
      default = false;
      description = ''
        Enables via, a keyboard configuration tool, and sets udev
        rules to make it function.
      '';
    };
  };
}
