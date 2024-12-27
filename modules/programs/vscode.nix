{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (builtins) toJSON;
  inherit (config.theme) fonts;
  inherit (config.profiles) workstation;
in {
  config = mkIf workstation.apps.vscode {
    hjem.users.lunarnova = {
      packages = with pkgs; [
        vscode
        alejandra
        nixd
      ];
      files = {
        ".config/Code/User/settings.json".text = toJSON {
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
  };
}
