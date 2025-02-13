{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkDefault mkIf;
in {
  options.profiles.workstation = {
    enable = mkEnableOption ''
      the workstation modules. This mainly installs and
      configures noteable programs like neovim and obsidian for
      writing and programming.
    '';
    apps = {
      nvf = mkEnableOption ''
        nvf (nix vim flake) for neovim usage and configuration.
      '';
      obsidian = mkEnableOption ''
        Obsidian Markdown Editor.
      '';
      vscode = mkEnableOption ''
        VSCode, a code editor.
      '';
      zed = mkEnableOption ''
        Zed, a code editor.
      ''; # Zed is currently disabled by default.
    };
  };
  config = mkIf config.profiles.workstation.enable {
    profiles.workstation.apps = {
      nvf = mkDefault true;
      obsidian = mkDefault true;
      vscode = mkDefault true;
    };
  };
}
