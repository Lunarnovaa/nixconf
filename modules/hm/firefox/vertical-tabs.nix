{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
  firefox-csshacks = pkgs.fetchFromGitHub {
    owner = "MrOtherGuy";
    repo = "firefox-csshacks";
    rev = "91efcba213560eeaa67812672c60b9137e222676";
    hash = "sha256-+psMiy3WFkYDL7HI5KBKU5b+r9qxudytkYlmqGNJS3o=";
  };
in {
  config = mkIf config.firefox-vertical-tabs.enable {
    programs.firefox.profiles.lunarnova = {
      #extensions = [inputs.firefox-addons.packages."x86_64-linux".sidebery];

      settings = {"toolkit.legacyUserProfileCustomizations.stylesheets" = true;};

      userChrome = ''
        @import url(${firefox-csshacks}/chrome/window_control_placeholder_support.css);
        @import url(${firefox-csshacks}/chrome/hide_tabs_toolbar.css);
      '';
    };
  };
}
