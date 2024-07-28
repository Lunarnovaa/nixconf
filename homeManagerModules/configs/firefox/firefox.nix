{
  inputs,
  lib,
  config,
  ...
}: {
  /*
    imports = [
    ./bookmarks.nix
    ./search-engines.nix
    ./vertical-tabs.nix
  ];
  */
  firefox-vertical-tabs.enable =
    lib.mkDefault false;

  programs.firefox = {
    enable = true;
    profiles.lunarnova = {
      search.force = true;

      settings = {
      };

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
      ];
    };
  };
}
