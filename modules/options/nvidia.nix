{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
in {
  options = {
    nvidia.enable =
      mkEnableOption "enables nvidia drivers";
  };
}
