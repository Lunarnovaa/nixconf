{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
in {
  programs.firefox = {
    enable = true;
    profiles.lunarnova = {
      isDefault = true;

      search = {
        # Enable search configuration
        force = true;
        #Default Search Engine
        default = "DuckDuckGo";
      };
      
      settings = mkIf (! config.firefox-vertical-tabs.enable) {
        "browser.tabs.groups.enable" = true;
      };
      
    };
  };
}
