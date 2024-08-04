{
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    gui-dev.enable =
      lib.mkEnableOption "enables gui-dev";
  };
  config = lib.mkIf config.gui-dev.enable {
    programs.vscode = {
      enable = true;
      #extensions = with pkgs.vscode-extensions; [ #not currently working for some reason
      # jnoortheen.nix-ide
      #];
    };
  };
}
