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
in {
  config = mkIf config.vscode.enable {
    home.packages = with pkgs; [alejandra nixd];
    programs.vscode = {
      enable = true;
      #extensions = with pkgs.vscode-extensions; [ #not currently working for some reason
      # jnoortheen.nix-ide
      #];
      userSettings = {
        "editor.fontFamily" = "${fonts.monospace}";
        "editor.fontLigatures" = true;
        "workbench.colorTheme" = "Catppuccin Macchiato";

        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
        "nixpkgs"."expr" = "import ${inputs.nixpkgs} { }";
        "formatting"."command" = ["alejandra"];
      };
    };
  };
}
