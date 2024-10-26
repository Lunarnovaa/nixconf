{pkgs, ...}: let
  pdbImageLink = "https://www.protondb.com/sites/protondb/images/site-logo.svg";

  pdbImage = pkgs.fetchurl {
    url = pdbImageLink;
    sha256 = "1q19x63dhjbsjc1nj58cv6w3ag5ciipv15g9h1hdm6mjf2db9fja";
  };
in {
  programs.firefox.profiles.lunarnova.search.engines = {
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
    "Nix Options" = {
      urls = [
        {
          template = "https://search.nixos.org/options";
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
      definedAliases = ["@no"];
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

    "ProtonDB" = {
      urls = [{template = "https://www.protondb.com/search?q={searchTerms}";}];
      icon = "${pdbImage}";
      updateInterval = 24 * 60 * 60 * 1000; # every day
      definedAliases = ["@pdb"];
    };
    "Rate My Professor" = {
      urls = [{template = "https://www.ratemyprofessors.com/search/professors/1506?q={searchTerms}";}];
      updateInterval = 24 * 60 * 60 * 1000; # every day
      definedAliases = ["@rmp"];
    };
  };
}
