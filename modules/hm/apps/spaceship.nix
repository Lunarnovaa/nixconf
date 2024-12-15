{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
in {
  config = mkIf config.terminal.apps.spaceship {
    programs.starship = {
      enable = true;
      enableNushellIntegration = true;

      settings = {
        add_newline = false;
        character = {
          success_symbol = "[>](bold green)";
          error_symbol = "[x](bold red)";
          vimcmd_symbol = "[<](bold green)";
        };
        git_commit = {
          tag_symbol = " tag ";
        };
        git_status = {
          ahead = ">";
          behind = "<";
          diverged = "<>";
          renamed = "r";
          deleted = "x";
        };
        git_branch = {
          symbol = "git ";
        };
        memory_usage = {
          symbol = "memory ";
        };
        nix_shell = {
          symbol = "nix ";
        };
        os.symbols = {
          NixOS = "nix ";
        };
        package = {
          symbol = "pkg ";
        };
        rust = {
          symbol = "rs ";
        };
        status = {
          symbol = "[x](bold red) ";
        };
      };
    };
  };
}
