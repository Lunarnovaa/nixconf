{lib, ...}: let
  inherit
    (lib)
    mkEnableOption
    ;
in {
  options = {
    firefox-vertical-tabs.enable =
      mkEnableOption "enables vertical tabs on firefox";
  };
}
