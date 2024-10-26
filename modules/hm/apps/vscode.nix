{
  inputs,
  lib,
  config,
  osConfig,
  options,
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
  flake = pkgs.pkgs.fetchurl {
    url = "https://github.com/Lunarnovaa/nixconf";
    sha256 = "1qp2xhwdixmgfl4yaw1a9cldbbi6lyxlz6vqgg6gpkq5ylv8lhy7";
  };
in {
  config = mkIf config.vscode.enable {
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
