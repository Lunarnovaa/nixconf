{
  pkgs,
  lib,
  ...
}: let
  inherit (builtins) toJSON;
  toINI = lib.generators.toINI {};
in {
  hjem.users.lunarnova = {
    packages = with pkgs; [firefox];
    files = {
      ".mozilla/firefox/profiles.ini".text = toINI {
        Profile0 = {
          # creates lunarnova profile and sets it as default
          Name = "lunarnova";
          IsRelative = 1;
          Path = "lunarnova";
          Default = 1;
        };
      };
      ".mozilla/firefox/distribution/policies.json".text = toJSON {
        "policies" = {
          "SearchEngines"."Default" = "DuckDuckGo";
        };
      };
    };
  };
}
