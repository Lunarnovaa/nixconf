{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;
  inherit (builtins) toJSON;
  firefox-csshacks = pkgs.fetchFromGitHub {
    owner = "MrOtherGuy";
    repo = "firefox-csshacks";
    rev = "91efcba213560eeaa67812672c60b9137e222676";
    hash = "sha256-+psMiy3WFkYDL7HI5KBKU5b+r9qxudytkYlmqGNJS3o=";
  };
in {
  config = mkIf config.sysconf.verticalTabs {
    hjem.users.lunarnova.files = {
      ".mozilla/firefox/distribution/policies.json".text = toJSON {
        "policies"."preferences"."toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      ".mozilla/firefox/lunarnova/chrome/userChrome.css".text = ''
        @import url(${firefox-csshacks}/chrome/window_control_placeholder_support.css);
        @import url(${firefox-csshacks}/chrome/hide_tabs_toolbar.css);
      '';
    };
  };
}
