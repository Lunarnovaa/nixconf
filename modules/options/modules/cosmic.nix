{lib, ...}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) bool;
in {
  options.cosmic = {
    enable = mkOption {
      type = bool;
      default = false;
      description = ''
        Whether to enable Cosmic Desktop Environment modules.
      '';
    };
  };
}
