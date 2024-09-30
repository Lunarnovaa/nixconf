{
  inputs,
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
in {
  config = mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      #extensions = with pkgs.vscode-extensions; [ #not currently working for some reason
      # jnoortheen.nix-ide
      #];
    };
  };
}
