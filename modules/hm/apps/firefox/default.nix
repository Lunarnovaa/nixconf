{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./search-engines.nix
    ./vertical-tabs.nix
  ];

  programs.firefox = {
    enable = true;
    profiles.lunarnova = {
      isDefault = true;

      search = {
        # Enable search configuration
        force = true;
        #Default Search Engine
        default = "DuckDuckGo";
      };
    };
  };
}
