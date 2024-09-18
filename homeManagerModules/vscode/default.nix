{
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    vscode.enable =
      lib.mkEnableOption "enables vscode";
  };
  config = lib.mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      #extensions = with pkgs.vscode-extensions; [ #not currently working for some reason
      # jnoortheen.nix-ide
      #];
    };
  };
}
