{pkgs, ...}: let
  inherit (builtins) toJSON;
  pdbImageLink = "https://www.protondb.com/sites/protondb/images/site-logo.svg";

  pdbImage = pkgs.fetchurl {
    url = pdbImageLink;
    sha256 = "1q19x63dhjbsjc1nj58cv6w3ag5ciipv15g9h1hdm6mjf2db9fja";
  };
in {
  hjem.users.lunarnova.files."mozilla/firefox/distribution/policies.json".text = toJSON {
    "policies"."SearchEngines"."Add" = [
      {
        "Name" = "Nix Packages";
        "URLTemplate" = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
        "Method" = "GET";
        "IconURL" = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        "Alias" = "@np";
      }
      {
        "Name" = "Nix Options";
        "URLTemplate" = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
        "Method" = "GET";
        "IconURL" = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        "Alias" = "@no";
      }
      {
        "Name" = "NixOS Wiki";
        "URLTemplate" = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
        "Method" = "GET";
        "IconURL" = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        "Alias" = "@nw";
      }
      {
        "Name" = "Home Manager Options";
        "URLTemplate" = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";
        "Method" = "GET";
        "IconURL" = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        "Alias" = "@hmo";
      }
      {
        "Name" = "ProtonDB";
        "URLTemplate" = "https://www.protondb.com/search?q={searchTerms}";
        "Method" = "GET";
        "IconURL" = "${pdbImage}";
        "Alias" = "@pdb";
      }
      {
        "Name" = "Rate My Professor";
        "URLTemplate" = "https://www.ratemyprofessors.com/search/professors/1506?q={searchTerms}";
        "Method" = "GET";
        "Alias" = "@rmp";
      }
    ];
  };
}
