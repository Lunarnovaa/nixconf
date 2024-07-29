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
      settings = {
      };

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
          definedAliases = ["$np"];
        };
      };

      /*
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        # General Privacy
        ublock-origin
        duckduckgo-privacy-essentials
        facebook-container
        snowflake
        # Youtube
        sponsorblock
        enhancer-for-youtube
        untrap-for-youtube
        return-youtube-dislikes
        # Reddit
        old-reddit-redirect
        reddit-enhancement-suite
        # Utility
        streetpass-for-mastodon
        betterttv
        indie-wiki-buddy
        bitwarden
        protondb-for-steam
      ];
      */
    };
  };
}
