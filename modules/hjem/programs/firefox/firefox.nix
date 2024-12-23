{
  pkgs,
  lib,
  ...
}: let
  inherit (builtins) toJSON;
  toINI = lib.generators.toINI {};
in {
  homes.lunarnova = {
    packages = with pkgs; [firefox];
    files = {
      ".mozilla/firefox/distribution/policies.json" = {
        clobber = true;
        text = toJSON {
          "policies" = {
            "SearchEngines"."Default" = "DuckDuckGo";
          };
        };
      };
      ".mozilla/firefox/profiles.ini".text = toINI {
        Profile0 = {
          # creates lunarnova profile and sets it as default
          Name = "lunarnova";
          IsRelative = 1;
          Path = "lunarnova";
          Default = 1;
        };
      };
    };
  };
}
