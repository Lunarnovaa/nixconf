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
  inherit (config.theme) fonts;
in {
  config = mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      #extensions = with pkgs.vscode-extensions; [ #not currently working for some reason
      # jnoortheen.nix-ide
      #];
      userSettings = {
        "editor.fontFamily" = "${fonts.monospace}, ${fonts.icons}";
        "editor.fontLigatures" = true;
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "workbench.iconTheme" = "Catppuccin Macchiato";
      };
    };
  };
}
