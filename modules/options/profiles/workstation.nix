{
  lib,
  config,
  ...
}: let
  inherit
    (lib.options)
    mkOption
    ;
  inherit
    (lib.types)
    bool
    ;
in {
  options.profiles.workstation = {
    enable = mkOption {
      type = bool;
      default = false;
      description = ''
        Enables the workstation modules. This mainly installs and
        configures noteable programs like neovim and obsidian for
        writing and programming.
      '';
    };
    apps = {
      nvf = mkOption {
        type = bool;
        default = config.profiles.workstation.enable;
        description = ''
          Enables nvf (nix vim flake) for neovim usage and
          configuration.
        '';
      };
      obsidian = mkOption {
        type = bool;
        default = config.profiles.workstation.enable;
        description = ''
          Enables Obsidian.
        '';
      };
      vscode = mkOption {
        type = bool;
        default = config.profiles.workstation.enable;
        description = ''
          Enables and configures Obsidian for markdown editing.
        '';
      };
      zed = mkOption {
        type = bool;
        default = false;
        description = ''
          Enables Zed. Currently disabled by default.
        '';
      };
    };
  };
}
