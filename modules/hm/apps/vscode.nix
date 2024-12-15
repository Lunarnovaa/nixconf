{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
  inherit
    (config.theme)
    fonts
    ;
  inherit
    (config.profiles)
    workstation
    ;
in {
  config = mkIf workstation.apps.vscode {
    home.packages = with pkgs; [alejandra nixd];
    programs.vscode = {
      enable = true;
      userSettings = {
        "editor.fontFamily" = "${fonts.monospace}";
        "editor.fontLigatures" = true;
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "catppuccin.accentColor" = "red";

        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
        "nixpkgs"."expr" = "import ${inputs.nixpkgs} { }";
        "formatting"."command" = ["alejandra"];
      };
    };
  };
}
