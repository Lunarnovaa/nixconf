{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkIf
    mkDefault
    ;
in {
  options = {
    # Create workstation profile option
    profile.workstation.enable =
      mkEnableOption "enables workstation profile";

    # Create options for workstation programs
    obsidian.enable =
      mkEnableOption "enables obsidian";
    vscode.enable =
      mkEnableOption "enables vscode";
    zed.enable =
      mkEnableOption "enables zed-editor";
  };

  # Enable workstation programs
  config = mkIf config.profile.workstation.enable {
    obsidian.enable = mkDefault true;
    vscode.enable = mkDefault true;
    zed.enable = mkDefault true;
  };
}
