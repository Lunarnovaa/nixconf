{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  inherit (builtins) toJSON;
in {
  config = mkIf (! config.sysconf.verticalTabs) {
    hjem.users.lunarnova.files.".mozilla/firefox/distribution/policies.json".text = toJSON {
      "policies"."preferences"."browser.tabs.groups.enable" = true;
    };
  };
}
