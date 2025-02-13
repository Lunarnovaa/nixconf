{lib, ...}: let
  inherit (lib.options) mkEnableOption;
in {
  options.sysconf = {
    nvidia = mkEnableOption ''
      Nvidia modules. This enables special driver configuration
      and configures the DE for nvidia optimizations and bugfixes.
    '';

    powersave = mkEnableOption ''
      signals that the system wants to maximize power usage. This
      currently configures Hyprland to minimize performance expensive
      eye candy.
    '';

    verticalTabs = mkEnableOption ''
      vertical tabs in Firefox, along with custom CSS. Keep
      in mind you still need to install the Sidebery extension for
      this to work properly, as extensions are not managed
      declaratively.
    '';
  };
}
