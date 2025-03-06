{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkDefault mkIf;

  cfg = config.profiles.workstation;
in {
  options.profiles.workstation = {
    enable = mkEnableOption ''
      the workstation modules. This mainly installs and
      configures noteable programs like neovim and obsidian for
      writing and programming.
    '';
    programs = {
      nvf.enable = mkEnableOption ''
        nvf (nix vim flake) for neovim usage and configuration.
      '';
      obsidian.enable = mkEnableOption ''
        Obsidian Markdown Editor.
      '';
      vscode.enable = mkEnableOption ''
        VSCode, a code editor.
      '';
      zed.enable = mkEnableOption ''
        Zed, a code editor.
      ''; # Zed is currently disabled by default.
    };
  };
  config = mkIf cfg.enable {
    profiles.workstation.programs = {
      nvf.enable = mkDefault true;
      obsidian.enable = mkDefault true;
      vscode.enable = mkDefault true;
    };
  };
}
