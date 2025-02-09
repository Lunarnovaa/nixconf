{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) bool;
in {
  options.terminal = {
    enable = mkOption {
      type = bool;
      default = true;
      description = ''
        Enables the terminal modules, installing and configuring
        the terminal emulator, shell, and prompt.
      '';
    };
    apps = {
      alacritty = mkOption {
        type = bool;
        default = config.terminal.enable;
        description = ''
          Enables the alacritty module
        '';
      };
      nushell = mkOption {
        type = bool;
        default = config.terminal.enable;
        description = ''
          Enables the nushell module, including aliases
        '';
      };
      spaceship = mkOption {
        type = bool;
        default = config.terminal.enable;
        description = ''
          Enables the spaceship module
        '';
      };
    };
  };
}
