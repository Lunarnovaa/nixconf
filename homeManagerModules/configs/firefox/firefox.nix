{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    #./bookmarks.nix
    ./vertical-tabs.nix
  ];

  firefox-vertical-tabs.enable =
    lib.mkDefault false;

  programs.firefox = {
    enable = true;
    profiles.lunarnova = {
      search.force = true;
      isDefault = true;
      settings = {};

      search.engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = ["@np"];
        };

        "NixOS Wiki" = {
          urls = [{template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";}];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = ["@nw"];
        };

        "Home Manager Options" = {
          urls = [{template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";}];
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = ["@hmo"];
        };
      };
    };
  };
}
