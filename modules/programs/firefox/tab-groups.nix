{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  inherit (builtins) toJSON;
in {
  config = mkIf (! config.sysconf.verticalTabs) {
    homes.lunarnova.files.".mozilla/firefox/distribution/policies.json" = {
      clobber = true;
      text = toJSON {
        "policies"."preferences"."browser.tabs.groups.enable" = true;
      };
    };
  };
}
