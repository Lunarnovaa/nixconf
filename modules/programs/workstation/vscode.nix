{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.theme) fonts;
  inherit (config.profiles) workstation;
in {
  config = mkIf workstation.apps.vscode {
    hjem.users.lunarnova.rum.programs.vscode = {
      enable = true;
      settings = {
        "editor.fontFamily" = "${fonts.monospace}";
        "editor.fontLigatures" = true;
        "workbench.colorTheme" = "Catppuccin Mocha";
        "catppuccin"."accentColor" = "red";

        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        "nix.enableLanguageServer" = true;
        "nixpkgs"."expr" = "import ${inputs.nixpkgs} { }";
        "formatting"."command" = ["${pkgs.alejandra}/bin/alejandra"];
      };
    };
  };
}
