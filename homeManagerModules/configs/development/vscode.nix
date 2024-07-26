{
  inputs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.development.enable {
    programs.vscode = {
      enable = true;
      #extensions = with pkgs.vscode-extensions; [ #not currently working for some reason
      # jnoortheen.nix-ide
      #];
    };
  };
}
